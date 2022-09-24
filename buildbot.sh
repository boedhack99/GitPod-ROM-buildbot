# Rom building script for CircleCI
# coded by bruh™ aka Live0verfl0w

MANIFEST_LINK=https://github.com/Evolution-X/manifest
BRANCH=tiramisu
ROM_NAME=Evolution-X
GITHUB_USER=boedhack99
GITHUB_EMAIL=boedhack@gmail.com
WORK_DIR=$(pwd)/${ROM_NAME}
JOBS=nproc

# Set up git!
git config --global user.name ${GITHUB_USER}
git config --global user.email ${GITHUB_EMAIL}

# make directories
mkdir ${WORK_DIR} && cd ${WORK_DIR}

device
git clone --depth=1 https://github.com/boedhack99/local_manifest -b fog-13 --single-branch -b .repo/local_manifests
#git clone --depth=1 https://github.com/I-n-o-k/prebuilt_vendor_juice --single-branch -b 11 vendor/xiaomi/juice
#git clone --depth=1 https://github.com/MiBengal-Development/android_kernel_xiaomi_bengal  --single-branch -b 11.0 kernel/xiaomi/juice
#git clone --depth=1 https://github.com/GengKapak/GengKapak-clang --single-branch -b 13 prebuilts/clang/host/linux-x86/clang-gengkapak

repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j8

# Start building!
. build/envsetup.sh
lunch evution_fog-userdebug
mka evolution

