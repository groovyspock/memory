# 不同操作系统进行不同的处理
```ant
<?xml version="1.0" encoding="utf-8"?>
<project name="osexample" default="createPackage" basedir=".">
    <target name="osjudge">
      <condition property="isWindows">
        <os family="windows"/>
      </condition>
      <condition property="isLinux">
        <os family="unix"/>
      </condition>
    </target>

    <target name="compilelinux" if="isLinux" depends="osjudge">
      <exec executable="sh" failonerror="true">
              <arg line="-c 'mvn clean install -Dmaven.test.skip=true'" />
      </exec>
    </target>

    <target name="compilewin" if="isWindows" depends="osjudge">
      <exec executable="cmd.exe" failonerror="true" >
        <arg line="/c mvn clean install -DskipTests" />
      </exec>
    </target>

    <target name="createPackage" depends="osjudge,compilewin,compilelinux">
      <echo>
        createPackage..
      </echo>
    </target>
</project>
```
