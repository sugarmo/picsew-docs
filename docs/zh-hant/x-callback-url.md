## 什麼是 X-Callback-URL？

Picsew 實現了 [x-callback-url](http://x-callback-url.com/) 協議，這是一種通用的 URL Scheme 協議。它能讓你在不同的 App 之間通信，[Workflow](https://workflow.is/)、[Launch Center Pro](https://contrast.co/launch-center-pro/) 等 App 都支持了 x-callback-url，因此 Picsew 也支持與他們協作。

Picsew 的 x-callback-url 格式為：

```
picsew://x-callback-url/[動作]?[動作參數]&[x-callback 參數]
```

## 動作

### /scroll

使用指定的圖片進行長截圖拼接

### /vert

使用指定的圖片進行豎向拼接。

### /hori

使用指定的圖片進行橫向拼接。

## 動作參數

- **in** *（必選）* 指定如何獲取輸入圖片，可選值為 `paste`、`latest` 和 `recent`。當為 `paste` 時，從剪貼板粘貼圖片。當為 `latest` 時，獲取設備相冊的最後 N 張圖片，N 由另一個參數 `count` 決定。當為 `recent` 時，自動檢測最近的截圖。

- **count** 當 `in=latest` 時，為必選參數，指定要獲取的圖片的數量。
    
- **out** *（必選）* 指定如何輸出拼接結果，可選值為 `copy`、`save` 和 `save_copy`。當為 `copy` 時，複製結果到剪貼板。當為 `save` 時，保存結果到設備相冊。當為 `save_copy` 時，保存並複製結果。

- **watermark** *（可選）* 指定是否加上水印，可選值為 `single` 和 `repeat`，默認不加上水印。水印文字和位置都使用 App 內的默認水印設置，如果未設置妥當，則最終結果也不會有水印。當為 `single` 時，在拼圖的默認位置添加一個水印。當為 `repeat` 時，在每張圖的默認位置都添加一個水印。

- **border** *（可選）* 指定是否加上邊框，可選值為 `inside`、`outside` 和 `all`，默認不加上邊框。當為 `inside` 時，在拼圖內部加上邊框。當為 `outside` 時，在拼圖外部加上邊框。當為 `all` 時，在拼圖的內部和外部都加上邊框。如果想指定寬度，可在後面加上 `_<0~100>`，例如 `inside_60`。

- **mockup** 不可用，已升級為 mockup2。

- **mockup2** *（可選）* 指定是否加上套殼，具體可選值請查閱「套殼參數」幫助文檔。

- **clean_status** *（可選）* 指定是否需要清理狀態欄，當為 `yes` 時，自動清理狀態欄。默認不清理。

- **remove_scrollbar** *（可選）* 指定是否需要移除滾動條，當為 `yes` 時，自動移除滾動條。默認不移除。

- **delete_source** *（可選）* 指定是否需要刪除原始圖片，當為 `yes` 時，刪除原始圖片。默認不刪除。

## 例子

- 使用最近的截圖進行長截圖拼接，自動清理狀態欄，並且加上藍色 iPhone 14 套殼，把結果保存到設備相冊，然後刪除原始圖片。

```
picsew://x-callback-url/scroll?in=recent&out=save&clean_status=yes&mockup2=iphone-14-blue&delete_source=yes
```

- 使用設備相冊的最後3張圖進行豎向拼接，每張圖片都加上默認水印，把結果複製到剪貼板。

```
picsew://x-callback-url/vert?in=latest&count=3&out=copy&watermark=repeat
```
