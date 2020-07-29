#!/bin/bash

travis_retry wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
travis_retry sudo mv cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
travis_retry sudo apt-key adv --fetch-keys https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/7fa2af80.pub
travis_retry sudo add-apt-repository "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/ /"
travis_retry sudo apt-get update
travis_retry sudo apt-get -y install cuda

#export CUDA=10-1-local-10.1.168-418.67_1.0-1
#export CUDA_APT_LIST=10-1-local-10.1.168-418.67
#export CUDA_VER=10.1
#
#travis_retry wget https://developer.nvidia.com/compute/cuda/10.1/Prod/local_installers/cuda-repo-ubuntu1604-${CUDA}_amd64.deb
#travis_retry sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
#travis_retry sudo dpkg -i cuda-repo-ubuntu1604-${CUDA}_amd64.deb
#travis_retry sudo apt-get update -qq -o Dir::Etc::sourcelist="sources.list.d/cuda-${CUDA_APT_LIST}.list" -o Dir::Etc::sourceparts="-" -o APT::Get::List-Cleanup="0"
#
#export CUDA_VER_MAJOR=${CUDA_VER%.*}
#export CUDA_VER_MINOR=${CUDA_VER#*.}
#export CUDA_APT=${CUDA_VER/./-}
#
#export CUDA_HOME=/usr/local/cuda-${CUDA_VER}
#export LD_LIBRARY_PATH=${CUDA_HOME}/nvvm/lib64:${LD_LIBRARY_PATH}
#export LD_LIBRARY_PATH=${CUDA_HOME}/lib64:${LD_LIBRARY_PATH}
#export PATH=${CUDA_HOME}/bin:${PATH}
#
## The cuda-core package is deprecated in favour of cuda-compiler, available from
## version 9.1 onwards
##
#CUDA_PKGS="cuda-drivers cuda-cudart-dev-${CUDA_APT} "
#if [ ${CUDA_VER_MAJOR} -ge 10 ]; then
#  CUDA_PKGS+="cuda-compiler-${CUDA_APT} "
#else
#  CUDA_PKGS+="cuda-core-${CUDA_APT} "
#fi
#
## cuda-cublas-dev is not available for 10.1; use the version from 10.0 instead
##
#if [ ${CUDA_INSTALL_EXTRA_LIBS:-1} -ne 0 ]; then
#  CUDA_PKGS+="cuda-cufft-dev-${CUDA_APT} cuda-cusparse-dev-${CUDA_APT} "
#
#  if [ ${CUDA_VER_MAJOR} -ge 7 ]; then
#    CUDA_PKGS+=" cuda-cusolver-dev-${CUDA_APT} "
#  fi
#  CUDA_PKGS+="libcublas-dev "
#fi
#
#travis_retry sudo apt-get install -y ${CUDA_PKGS}
#travis_retry sudo apt-get clean
