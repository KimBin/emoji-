# emoji!

## Project Description
#### 中文
顏文字列表，資料來源是[這裡](http://apps.timwhitlock.info/emoji/tables/unicode)。
Header 顯示的是 emoji 的分類，點不同的 emoji，其名稱會顯示在 Footer 裡，
emoji 下方的 16 進位碼表示它的 unicode 值。

#### English
emoji list, the data source comes from [here](http://apps.timwhitlock.info/emoji/tables/unicode).
Header section displays the category of emoji, the name of emoji will display on Footer after tapping it.
The HEX value under different emoji indicates its unicode value.


## Example
![Example](https://github.com/tsunghao/emoji-/blob/master/screenshot.png)

## File Description
| Filename | Purpose |
|---|---|
| CollectionViewController.swift | Main page view controller for collection view |
| EmojiCell.swift | Cell class in collection view |
| HeaderReusableView.swift | Header view class in collection view |
| FooterReusableView.swift | Footer view class in collection view |
| Main.storyboard | UI layout |
| Info.plist | meta information for app |

## Note

Does not implement [Uncategorized emoji](http://apps.timwhitlock.info/emoji/tables/unicode#block-5-uncategorized)
