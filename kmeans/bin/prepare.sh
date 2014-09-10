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

bin=`dirname "$0"`
bin=`cd "$bin"; pwd`

echo "========== preparing kmeans data =========="
# configure
DIR=`cd $bin/../; pwd`
. "${DIR}/../bin/hibench-config.sh"
. "${DIR}/conf/configure.sh"


# compress check
if [ $COMPRESS -eq 1 ]; then
    COMPRESS_OPT="-compress true \
        -compressCodec $COMPRESS_CODEC \
        -compressType BLOCK "
else
    COMPRESS_OPT="-compress false"
fi

# paths check
$HADOOP_HOME/bin/hadoop dfs -rmr ${INPUT_HDFS}

# generate data
HADOOP_CLASSPATH1=`${MAHOUT_HOME}/bin/mahout classpath | tail -1`
HADOOP_CLASSPATH1=$HADOOP_CLASSPATH1:/tmp/hibench-mod/common/autogen/lib/uncommons-maths-1.2.2.jar:/tmp/hibench-mod/common/autogen/lib/mahout-math-0.8.0.2.0.6.1-101.jar:/tmp/hibench-mod/common/autogen/lib/mahout-core-0.8.0.2.0.6.1-101.jar

OPTION="-sampleDir ${INPUT_SAMPLE} -clusterDir ${INPUT_CLUSTER} -numClusters ${NUM_OF_CLUSTERS} -numSamples ${NUM_OF_SAMPLES} -samplesPerFile ${SAMPLES_PER_INPUTFILE} -sampleDimension ${DIMENSIONS}"

export HADOOP_CLASSPATH=$HADOOP_CLASSPATH1
echo $HADOOP_CLASSPATH

exec "$HADOOP_HOME/bin/hadoop" --config $HADOOP_CONF_DIR jar ${DATATOOLS} org.apache.mahout.clustering.kmeans.GenKMeansDataset -libjars "/usr/lib/mahout/mahout-core-0.8.0.2.0.6.1-101.jar,/tmp/hibench-mod/common/autogen/lib/uncommons-maths-1.2.2.jar,/usr/lib/mahout/mahout-core-0.8.0.2.0.6.1-101-job.jar" ${COMPRESS_OPT} ${OPTION}

