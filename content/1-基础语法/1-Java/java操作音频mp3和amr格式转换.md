---
title: 音频mp3和amr格式转换
tags:
  - java
  - mp3
  - amr
---
# 一、问题
目前大部分java方式操作音频格式转换的都需要安装和配置ffmpeg文件，否则可能会报编/解码器丢失的错误。该方式在本机执行还可以，但是真正运用到生产，由于涉及到扩缩容等问题，真要在生产环境再手动安装ffmpeg就很不方便。该种方式可参考[https://github.com/dadiyang/jave](https://github.com/dadiyang/jave)
这里推荐一种配置`pom`依赖的方式解决音频文件转换问题，亲测可用。
# 二、添加依赖
```xml title="pom.xml"
<!-- jave-core -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-core</artifactId>  
    <version>2.4.4</version>  
</dependency>  
  
<!-- 操作系统编码器包 选择对应环境-->  
<!-- MacOS -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-native-osx64</artifactId>  
    <version>2.4.4</version>  
</dependency>
<!-- Linux -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-native-linux64</artifactId>  
    <version>2.4.4</version>  
</dependency>
<!-- Windows --> 
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-nativebin-win64</artifactId>  
    <version>2.4.4</version>  
</dependency>
```
# 三、格式转换
```java
public static void main(String[] args) {  
    File source = new File("java/src/main/java/com/mdl/java/audio/ori-amr.amr");   // 源amr文件  
    File mp3Target = new File("java/src/main/java/com/mdl/java/audio/new-p3.mp3");   // 目标mp3文件  
    convertAudio(source, mp3Target);  
    System.out.println("conversion finished amr -> mp3");  
    File amrTarget = new File("java/src/main/java/com/mdl/java/audio/new-amr.amr");  // 目标amr文件  
    convertAudio(mp3Target, amrTarget);  
    System.out.println("conversion finished mp3 -> amr");  
} 

public static void convertAudio(File source, File target) {  
    AudioAttributes audio = new AudioAttributes();  
    audio.setCodec("libmp3lame");  
    EncodingAttributes attrs = new EncodingAttributes();  
    attrs.setFormat("mp3");  
    attrs.setAudioAttributes(audio);  
    Encoder encoder = new Encoder();  
    try {  
        MultimediaObject multimediaObject  = new MultimediaObject(source);  
        encoder.encode(multimediaObject,target, attrs);  
    } catch (IllegalArgumentException | EncoderException e) {  
        e.printStackTrace();  
    }  
}
```
# 四、源码地址
[Meidanlong/all-in-one](https://github.com/Meidanlong/all-in-one/blob/master/java/src/main/java/com/mdl/java/audio/AudioConversion.java)