# HHGuidePageHUD
### Swift 一行代码迅速集成APP新功能引导页, 支持静态图，动态图，视频
### Xcode9.1 Swift4.0 测试通过
#### 声明: 部分图片来源于网络,如有涉及版权会马上删除,敬请谅解;
#### 此工程是Swift版本，OC版本移步 https://github.com/dingding3w/DHGuidePageHUD
#### 但是我用的Swift，就用了原OC作者的一些资源，方便了很多，感谢!
## HHGuidePageHUD
### 效果图展示:
<table>
    <tr>
		<th>加载本地静态图片</th>
		<th>加载本地动态图片</th>
		<th>加载本地视频</th>
	</tr>
	<tr>
		<td><img src="https://github.com/xuehongle/HHGuidePageHUD/blob/master/DeviceImages/Screen%E9%9D%99%E6%80%81.gif" width="300"></td>
		<td><img src="https://github.com/xuehongle/HHGuidePageHUD/blob/master/DeviceImages/Screen%E5%8A%A8%E6%80%81.gif" width="300"></td>
		<td><img src="https://github.com/xuehongle/HHGuidePageHUD/blob/master/DeviceImages/Screen%E8%A7%86%E9%A2%91.gif" width="300"></td>
	</tr>
</table>

### 方法说明:
```swift
使用可能遇到问题的地方，
1.gif假若报空，可能是因为gif放到了assets里，移出来即可
2.mp4在bundle的时候为nil, 检查是否已加入Build Phases的Copy Bundle Resource
...

```

### 使用方式:
#### 1.下载项目或者下载项目中的HHGuidePageHUD文件,将下载好的HHGuidePageHUD文件拖拽到自己的工程文件夹中
#### 2. 代码如下:
静态图
```swift
let imageNameArray: [String] = ["guide00", "guide01", "guide02"]
let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
self.navigationController?.view.addSubview(guideView)
```
动态图
```swift
let imageNameArray: [String] = ["guideImage6.gif", "guideImage7.gif", "guideImage8.gif"]
let guideView = HHGuidePageHUD.init(imageNameArray: imageNameArray, isHiddenSkipButton: false)
self.navigationController?.view.addSubview(guideView)
```
视频
```swift
let urlStr = Bundle.main.path(forResource: "1.mp4", ofType: nil)
let videoUrl = NSURL.fileURL(withPath: urlStr!)
let guideView = HHGuidePageHUD.init(videoURL:videoUrl, isHiddenSkipButton: false)
self.navigationController?.view.addSubview(guideView)
```
## 分享是一种美德,Star是一种鼓励!
