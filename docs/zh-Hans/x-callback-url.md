## 什么是 X-Callback-URL？

Picsew 实现了 [x-callback-url](http://x-callback-url.com/) 协议，这是一种通用的 URL Scheme 协议。它能让你在不同的 App 之间通信，[Workflow](https://workflow.is/)、[Launch Center Pro](https://contrast.co/launch-center-pro/) 等 App 都支持了 x-callback-url，因此 Picsew 也支持与他们协作。

Picsew 的 x-callback-url 格式为：

```
picsew://x-callback-url/[动作]?[动作参数]&[x-callback 参数]
```

## 动作

### /scroll

使用指定的图片进行长截图拼接

### /vert

使用指定的图片进行竖向拼接。

### /hori

使用指定的图片进行横向拼接。

## 动作参数

- **in** *（必选）* 指定如何获取输入图片，可选值为 `paste`、`latest` 和 `recent`。当为 `paste` 时，从剪贴板粘贴图片。当为 `latest` 时，获取设备相册的最后 N 张图片，N 由另一个参数 `count` 决定。当为 `recent` 时，自动检测最近的截图。

- **count** 当 `in=latest` 时，为必选参数，指定要获取的图片的数量。
    
- **out** *（必选）* 指定如何输出拼接结果，可选值为 `copy`、`save` 和 `save_copy`。当为 `copy` 时，复制结果到剪贴板。当为 `save` 时，保存结果到设备相册。当为 `save_copy` 时，保存并复制结果。

- **watermark** *（可选）* 指定是否加上水印，可选值为 `single` 和 `repeat`，默认不加上水印。水印文字和位置都使用 App 内的默认水印设置，如果未设置妥当，则最终结果也不会有水印。当为 `single` 时，在拼图的默认位置添加一个水印。当为 `repeat` 时，在每张图的默认位置都添加一个水印。

- **border** *（可选）* 指定是否加上边框，可选值为 `inside`、`outside` 和 `all`，默认不加上边框。当为 `inside` 时，在拼图内部加上边框。当为 `outside` 时，在拼图外部加上边框。当为 `all` 时，在拼图的内部和外部都加上边框。如果想指定宽度，可在后面加上 `_<0~100>`，例如 `inside_60`。

- **mockup** 不可用，已升级为 mockup2。

- **mockup2** *（可选）* 指定是否加上套壳，具体可选值请查阅「套壳参数」帮助文档。

- **clean_status** *（可选）* 指定是否需要清理状态栏，当为 `yes` 时，自动清理状态栏。默认不清理。

- **remove_scrollbar** *（可选）* 指定是否需要移除滚动条，当为 `yes` 时，自动移除滚动条。默认不移除。

- **delete_source** *（可选）* 指定是否需要删除原始图片，当为 `yes` 时，删除原始图片。默认不删除。

## 例子

- 使用最近的截图进行长截图拼接，自动清理状态栏，并且加上蓝色 iPhone 14 套壳，把结果保存到设备相册，然后删除原始图片。

```
picsew://x-callback-url/scroll?in=recent&out=save&clean_status=yes&mockup2=iphone-14-blue&delete_source=yes
```

- 使用设备相册的最后3张图进行竖向拼接，每张图片都加上默认水印，把结果复制到剪贴板。

```
picsew://x-callback-url/vert?in=latest&count=3&out=copy&watermark=repeat
```
