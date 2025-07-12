## What's X-Callback-URL?

Picsew implements the [x-callback-url](http://x-callback-url.com/) protocol, a generic URL Scheme protocol. It allows you to communicate between different apps. [Workflow](https://workflow.is/), [Launch Center Pro](https://contrast.co/launch-center-pro/) and other apps support x-callback-url, so Picsew also supports working with them.

Picsew's x-callback-url format is:

```
picsew://x-callback-url/[action]?[action parameters]&[x-callback parameters]
```

## Action

### /scroll

Use the specified images for Scrollshot Stitching.

### /vert

Use the specified images for Vertical Stitching.

### /hori

Use the specified images for Horizontal Stitching.

## Action Parameters

- **in** *(Required)* Specifies how to get the input image. The allowed values ​​are `paste`, `latest`, and `recent`. When `paste`, get the images from the clipboard. When `latest`, get the latest N images of the photo album, and N is determined by another parameter `count`. When `recent`, the most recent screenshots are automatically detected.

- **count** When `in=latest`, this is a required parameter, specify the number of images to get.

- **out** *(Required)* Specifies how to output the stitching result. The allowed values are `copy`, `save` and `save_copy`. When `copy`, copy the result to the clipboard. When `save`, save the result to the photo album. When `save_copy`, save and copy the result.

- **watermark** *(optional)* Specifies whether to add watermark. The allowed values ​​are `single` and `repeat`. By default, no watermark is added. Both watermark text and location use the default watermark setting in the App. If default setting not configure properly, the final result will not have a watermark. When `single`, add a single watermark to the default position of the result image. When `repeat`, a watermark is added to the default position of each image.

- **border** *(optional)* Specifies whether to add borders. The allowed values are `inside`, `outside` and `all`. By default, no border is added. When `inside`, add borders inside the result image. When `outside`, add borders outside the result image. When `all`, add borders inside and outside the result image. If you want to specify the width, you can add `_<0~100>` at the end, for example `inside_60`.

- **mockup** Unavailable, upgraded to mockup2.

- **mockup2** *(optional)* Specifies whether to add a mockup. For allowed values, please refer to the documatation of "Mockup Parameters".

- **clean_status** *(optional)* Specifies whether the status bar needs to be cleared. When `yes`, the status bar is automatically cleared. The default is not clear.

- **remove_scrollbar** *(optional)* Specifies whether the scrollbars needs to be removed. When `yes`, the scrollbars is automatically removed. The default is not to remove.

- **delete_source** *(optional)* Specifies whether the original images needs to be deleted. When `yes`, the original images will be deleted. It is not deleted by default.

## Examples

- Use the most recent screenshots for scrollshot stitching, automatically clear the status bar, add mockup of iPhone 14 Blue, save the results to the photo album, and then delete the original images.

```
picsew://x-callback-url/scroll?in=recent&out=save&clean_status=yes&mockup2=iphone-14-blue&delete_source=yes
```

- Vertical stitching using the latest 3 images of the photo album, add a default watermark to each image, copy the result to the clipboard.

```
picsew://x-callback-url/vert?in=latest&count=3&out=copy&watermark=repeat
```
