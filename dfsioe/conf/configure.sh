#!/bin/bash
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# paths
INPUT_HDFS=/benchmarks/TestDFSIO-Enh

# dfsioe-read
#RD_NUM_OF_FILES=256
RD_NUM_OF_FILES=10
RD_FILE_SIZE=10 #2000

# dfsioe-write
#WT_NUM_OF_FILES=256
WT_NUM_OF_FILES=10
WT_FILE_SIZE=10 #1000
