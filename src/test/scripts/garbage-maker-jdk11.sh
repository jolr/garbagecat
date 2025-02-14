#!/bin/sh
#
# Generates garbage collection logging for various collectors/settings.
#
# Usage: sh ./garbage-maker-jdk11.sh 
#

GARBAGECAT_HOME=~/workspace/garbagecat/target
GARBAGECAT_VERSION=-3.0.6-SNAPSHOT

##### Create GC Logging #####

# default decorator #

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-serial-new-serial-old.log::filesize=50M -XX:+UseSerialGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old.log::filesize=50M -XX:+UseParallelGC -XX:-UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting.log::filesize=50M -XX:+UseParallelGC -XX:+UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms.log::filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms.log::filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-g1.log::filesize=50M -XX:+UseG1GC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms32m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-shenandoah.log::filesize=50M -XX:+UseShenandoahGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

# uptime (seconds after JVM start) decorator #

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-serial-new-serial-old-uptime.log:uptime:filesize=50M -XX:+UseSerialGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-uptime.log:uptime:filesize=50M -XX:+UseParallelGC -XX:-UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-uptime.log:uptime:filesize=50M -XX:+UseParallelGC -XX:+UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms-uptime.log:uptime:filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms-uptime.log:uptime:filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-g1-uptime.log:uptime:filesize=50M -XX:+UseG1GC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms32m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-shenandoah-uptime.log:uptime:filesize=50M -XX:+UseShenandoahGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

# time (datestamp) decorator #

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-serial-new-serial-old-time.log:time:filesize=50M -XX:+UseSerialGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-time.log:time:filesize=50M -XX:+UseParallelGC -XX:-UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-time.log:time:filesize=50M -XX:+UseParallelGC -XX:+UseParallelOldGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms-time.log:time:filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx64m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-par-new-cms-time.log:time:filesize=50M -XX:+UseConcMarkSweepGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms1m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-g1-time.log:time:filesize=50M -XX:+UseG1GC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

java -Xms32m -Xmx96m -Xlog:gc*,safepoint=info:file=$GARBAGECAT_HOME/jdk11-shenandoah-time.log:time:filesize=50M -XX:+UseShenandoahGC -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -t 50 -o /dev/null ./gc.log

##### Analyze GC Logging #####

# default decorator #

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-serial-new-serial-old.txt $GARBAGECAT_HOME/jdk11-serial-new-serial-old.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p  -t 50 -o $GARBAGECAT_HOME/jdk11-par-new-cms.txt $GARBAGECAT_HOME/jdk11-par-new-cms.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-g1.txt $GARBAGECAT_HOME/jdk11-g1.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-shenandoah.txt $GARBAGECAT_HOME/jdk11-shenandoah.log

# uptime (seconds after JVM start) decorator #

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-serial-new-serial-old-uptime.txt $GARBAGECAT_HOME/jdk11-serial-new-serial-old-uptime.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-uptime.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-uptime.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-uptime.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-uptime.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p  -t 50 -o $GARBAGECAT_HOME/jdk11-par-new-cms-uptime.txt $GARBAGECAT_HOME/jdk11-par-new-cms-uptime.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-g1-uptime.txt $GARBAGECAT_HOME/jdk11-g1-uptime.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-shenandoah-uptime.txt $GARBAGECAT_HOME/jdk11-shenandoah-uptime.log

# time (datestamp) decorator #

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-serial-new-serial-old-time.txt $GARBAGECAT_HOME/jdk11-serial-new-serial-old-time.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-time.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-serial-old-time.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-time.txt $GARBAGECAT_HOME/jdk11-parallel-scavenge-parallel-old-compacting-time.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p  -t 50 -o $GARBAGECAT_HOME/jdk11-par-new-cms-time.txt $GARBAGECAT_HOME/jdk11-par-new-cms-time.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-g1-time.txt $GARBAGECAT_HOME/jdk11-g1-time.log

java -jar $GARBAGECAT_HOME/garbagecat$GARBAGECAT_VERSION.jar -p -t 50 -o $GARBAGECAT_HOME/jdk11-shenandoah-time.txt $GARBAGECAT_HOME/jdk11-shenandoah-time.log
