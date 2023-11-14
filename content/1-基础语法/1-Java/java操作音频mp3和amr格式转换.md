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
<!-- 经测试3.3.1版本在转码时会出现问题，建议降低版本 --> 
<jave.version>2.4.4</jave.version>


<!-- 该依赖包含一下全部依赖 -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-all-deps</artifactId>  
    <version>${jave.version}</version>  
</dependency>

<!-- 或 --> 

<!-- jave-core -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-core</artifactId>  
    <version>${jave.version}</version>   
</dependency>  
  
<!-- 操作系统编码器包 选择对应环境-->  
<!-- MacOS -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-native-osx64</artifactId>  
    <version>${jave.version}</version>  
</dependency>
<!-- Linux -->  
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-native-linux64</artifactId>  
    <version>${jave.version}</version>  
</dependency>
<!-- Windows --> 
<dependency>  
    <groupId>ws.schild</groupId>  
    <artifactId>jave-nativebin-win64</artifactId>  
    <version>${jave.version}</version>  
</dependency>
```
# 三、格式转换
```java title="音频格式转换代码"
public static void convertAudio(File source, File target) {  
    AudioAttributes audio = new AudioAttributes();  
    //audio.setCodec("libmp3lame");//mp3  
	//audio.setCodec("libopencore_amrnb");//amr-nb  
	audio.setCodec("libvo_amrwbenc");//amr-wb  
	//audio.setCodec("pcm_s16le");//wav  
	audio.setChannels(1);  
	audio.setSamplingRate(16000); 
    EncodingAttributes attrs = new EncodingAttributes();  
    //attrs.setFormat("mp3");  
    attrs.setFormat("amr");  //转换格式
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
```java title="查看所支持的codec种类"
public static void codec() {  
    Encoder encoder = new Encoder();  
    try {  
        for (int i = 0; i < encoder.getAudioEncoders().length; i++) {  
            System.out.println(encoder.getAudioEncoders()[i].toString());  
        }  
    } catch (EncoderException e) {  
        e.printStackTrace();  
    }  
}
```
```java title="查看支持的音频格式种类"
public static void encodingFormats() {  
    Encoder encoder = new Encoder();  
    try {  
        for (int i = 0; i < encoder.getSupportedEncodingFormats().length; i++) {  
            System.out.println(encoder.getSupportedEncodingFormats()[i].toString());  
        }  
    } catch (EncoderException e) {  
        e.printStackTrace();  
    }  
}
```
# 四、源码地址
[Meidanlong/all-in-one](https://github.com/Meidanlong/all-in-one/blob/master/java/src/main/java/com/mdl/java/audio/AudioConversion.java)
