#!/bin/bash

# Copyright (c) 2014, CableLabs, Inc.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# 1. Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# 2. Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
# AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
# IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
# LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
# CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
# SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
# CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
# POSSIBILITY OF SUCH DAMAGE.

function usage {
  echo ""
  echo "Transcode/Transrate Script"
  echo "usage:"
  echo "   video_2bitrates <input_file> <output_dir>"
}

if [ -z $1 ]; then
  echo "Must provide input media file"
  usage
  exit 1
fi
if [ -z $2 ]; then
  echo "Must provide output directory for transcoded/transrated files"
  usage
  exit 1
fi

mkdir -p $2

avconv -i $1 -codec:v libx264 -profile:v high -level 31 -b:v 2000k -codec:a libfdk_aac -profile:a aac_low $2/abr_h264-2Mb_aac-lc.mp4

avconv -i $1 -codec:v libx264 -profile:v high -level 31 -b:v 3000k -codec:a libfdk_aac -profile:a aac_low $2/abr_h264-3Mb_aac-lc.mp4

