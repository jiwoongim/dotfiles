#How to setup Hadoop & Maven

###1. Install Hadoop from  http://hadoop.apache.org/


###2. Install m2eclipse (Maven) 
    a. Goto Help -> Install new package
    b. Put http://download.eclipse.org/technology/m2e/releases
        (from http://eclipse.org/m2e/download/)


###3. Update the conf/core-site.xml file

```
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!-- Put site-specific property overrides in this file. -->
<configuration>
    <property>
        <name>fs.default.name</name>
        <value>hdfs://localhost:9000</value>
        <description>The name of the default file system. A URI whose scheme and authority determine the FileSystem implementation.</description>
    </property> 
</configuration>
```

###4. update the conf/mapred-site.xml file

```
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!-- Put site-specific property overrides in this file. -->
<configuration>
    <property>
        <name>mapred.job.tracker</name>
        <value>localhost:9001</value>
        <description>The host and port that the MapReduce job tracker runsat.   </description>
    </property> 
</configuration>
```

###5. update the conf/hdfs-site file

```
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="configuration.xsl"?>
<!-- Put site-specific property overrides in this file. -->
<configuration>
    <property>
        <name>dfs.replication</name>
        <value>1</value>
        <description>The actual number of replications can be s     pecified when the file is created.</description>
    </property> 
</configuration>
```

###6. bin/hadoop name node -format



###7. Goto conf/hadoop-env.sh, set

```
export JAVA_HOME=/Library/Java/Home
```

###8. bin/start-all.sh

###9. To fixed the SCDynamic Store issue caused by sercurity limites

```
export HADOOP_OPTS="-Djava.security.krb5.realm=OX.AC.UK -Djava.security.krb5.kdc=kdc0.ox.ac.uk:kdc1.ox.ac.uk"
```

###9. bin/hadoop fs -ls hdfs://localhost9000


