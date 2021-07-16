# Rom building script for CircleCI
# coded by bruh™ aka Live0verfl0w

MANIFEST_LINK=https://github.com/PixelOS-Pixelish
BRANCH=eleven
ROM_NAME=Pixel
GITHUB_USER=I-n-o-k
GITHUB_EMAIL=inok.dr189@gmail.com
WORK_DIR=$(pwd)/${ROM_NAME}
JOBS=nproc

# Set up git!
git config --global user.name ${GITHUB_USER}
git config --global user.email ${GITHUB_EMAIL}

# make directories
mkdir ${WORK_DIR} && cd ${WORK_DIR}

device
git clone --depth=1 https://github.com/MiBengal-Development/Device_xiaomi_J --single-branch -b PixelOs device/xiaomi/juice
git clone --depth=1 https://github.com/I-n-o-k/prebuilt_vendor_juice --single-branch -b 11 vendor/xiaomi/juice
git clone --depth=1 https://github.com/MiBengal-Development/android_kernel_xiaomi_bengal  --single-branch -b 11.0 kernel/xiaomi/juice
git clone --depth=1 https://github.com/GengKapak/GengKapak-clang --single-branch -b 13 prebuilts/clang/host/linux-x86/clang-gengkapak

# Start building!
. build/envsetup.sh
lunch aosp-juice-userdebug
mka bacon -j${JOBS}

