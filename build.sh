#!/bin/bash

CPU_JOB_NUM=$(grep processor /proc/cpuinfo | awk '{field=$NF};END{print field+1}')
CLIENT=$(whoami)

ROOT_DIR=$(pwd)

if [ $# -lt 1 ]
then
	echo "Usage: ./build.sh <PRODUCT> [ platform | all ]"
	exit 0
fi

if [ ! -f device/hardkernel/$1/build-info.sh ]
then
	echo "NO PRODUCT to build!!"
	exit 0
fi

source device/hardkernel/$1/build-info.sh
BUILD_OPTION=$2

OUT_DIR="$ROOT_DIR/out/target/product/$PRODUCT_BOARD"
KERN_DIR="$OUT_DIR/obj/KERNEL_OBJ/arch/arm/boot"
TMP_OUT_DIR="/tmp/$PRODUCT_BOARD"
OUT_HOSTBIN_DIR="$ROOT_DIR/out/host/linux-x86/bin"
KERNEL_CROSS_COMPILE_PATH="$ROOT_DIR/prebuilts/gcc/linux-x86/arm/arm-eabi-4.6/bin/arm-eabi-"

function check_exit()
{
	if [ $? != 0 ]
	then
		exit $?
	fi
}


function build_android()
{
        echo
        echo '[[[[[[[ Build android platform ]]]]]]]'
        echo

        START_TIME=`date +%s`
        echo "source build/envsetup.sh"
        source build/envsetup.sh
        echo
        echo "lunch cm_$PRODUCT_BOARD-userdebug"
        lunch cm_$PRODUCT_BOARD-userdebug
	echo 
	echo "Get CM-11 prebuilds"
	vendor/cm/get-prebuilts
        echo
        echo "make -j$CPU_JOB_NUM"
        echo
        make -j$CPU_JOB_NUM
        check_exit

        END_TIME=`date +%s`
        let "ELAPSED_TIME=$END_TIME-$START_TIME"
        echo "Total compile time is $ELAPSED_TIME seconds"
}


SYSTEMIMAGE_PARTITION_SIZE=$(grep "BOARD_SYSTEMIMAGE_PARTITION_SIZE " device/hardkernel/$PRODUCT_BOARD/BoardConfig.mk | awk '{field=$NF};END{print field}')

function copy_root_2_system()
{
	echo
    echo '[[[[[[[ copy ramdisk rootfs to system ]]]]]]]'
	echo

    rm -rf  $TMP_OUT_DIR
    mkdir -p $TMP_OUT_DIR
    cp -arp $OUT_DIR/system $TMP_OUT_DIR/
    cp -arp $OUT_DIR/root/* $TMP_OUT_DIR/system/

    mv $TMP_OUT_DIR/system/init $TMP_OUT_DIR/system/bin/
    mv $TMP_OUT_DIR/system/sbin/adbd $TMP_OUT_DIR/system/bin/
    cd $TMP_OUT_DIR/system/
    ln -s bin/init init
    cd $TMP_OUT_DIR/system/sbin
    ln -s ../bin/adbd adbd

  	echo $SYSTEMIMAGE_PARTITION_SIZE

    find $TMP_OUT_DIR/system -name .svn | xargs rm -rf
	$OUT_HOSTBIN_DIR/make_ext4fs -s -l $SYSTEMIMAGE_PARTITION_SIZE -a system $TMP_OUT_DIR/system.img $TMP_OUT_DIR/system

	sync
}

function make_update_zip()
{
	echo
	echo '[[[[[[[ Make update zip ]]]]]]]'
	echo

	if [ ! -d $TMP_OUT_DIR/update ]
	then
		mkdir $TMP_OUT_DIR/update
	else
		rm -rf $TMP_OUT_DIR/update/*
	fi

    echo '$PRODUCT_BOARD'

	cp $KERN_DIR/zImage $TMP_OUT_DIR/update/
	cp $TMP_OUT_DIR/system.img $TMP_OUT_DIR/update/
	cp $OUT_DIR/userdata.img $TMP_OUT_DIR/update/
	cp $OUT_DIR/cache.img $TMP_OUT_DIR/update/

	if [ -f $TMP_OUT_DIR/update.zip ]
	then
		rm -rf $TMP_OUT_DIR/update.zip
		rm -rf $TMP_OUT_DIR/update.zip.md5sum
	fi

	echo 'update.zip ->' $OUT_DIR
	pushd $TMP_OUT_DIR
	zip -r update.zip update/*
	md5sum update.zip > update.zip.md5sum
	check_exit

	echo
	popd
}


echo
echo '                Build android for '$PRODUCT_BOARD''
echo

case "$BUILD_OPTION" in
	platform)
		build_android
        copy_root_2_system
		make_update_zip
		;;
	all)
		build_android
        copy_root_2_system
		make_update_zip
		;;
	*)
        build_android
        copy_root_2_system
		make_update_zip
		;;
esac

echo ok success !!!

exit 0
