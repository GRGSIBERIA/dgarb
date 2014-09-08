# はじめに
よくSankaku Channel等のDanbooruをベースとした画像掲示板を愛用しています．
また，デスクトップ版のPicasaも大変便利な画像ビューアです．
DanbooruとPicasaの組み合わせは非常に強力です．

一方で，Danbooruでは豊富な画像の情報，及びアーティストの情報が有志の方が編集しているのに関わらず，Picasaではその情報を有効的に扱うことができません．

例えば，Danbooruで画像をダウンロードしても，その画像のExifにDanbooru固有の有意な情報が含まれません．
Picasaでは，Exifに情報が付加されていなければ，画像検索を行えません．
また，Picasaのメタ情報データベースは暗号化されているため，安易に編集することが難しいです．

そこで，手元の画像とDanbooruの画像を参照し，自動的にタグ情報を付加するためのシステムを考えました．
Danbooruによって管理されているタグ情報を，手元の画像へ反映させるシステムです．

このシステムによって，タグ情報の代わりにフォルダで管理するような手間を省き，なおかつPicasaの強力な画像検索機能を利用することが可能となります．

# 動作環境
画像の変換にRMagicとMiniExiftoolを利用しています．
また，文字エンコードの変換にNKFを利用しています．

# RMagick
RMagickはgemでインストール出来ないため，下記を参照してください．

[RMagic を Windows 7 にインストールする方法](http://www.ownway.info/Ruby/index.php?rmagick%2Fhowtoinstall%2Fwindows)

# MiniExiftool
MiniExiftoolもExifToolが必要なので，下記を参照してください．
なお，System32にExifToolをインストールするとエラーが出るため，他のフォルダへ移してパスを通してください．

[Installing ExifTool](http://www.sno.phy.queensu.ca/~phil/exiftool/install.html#Windows)

# NKF
NKFは下記のダウンロードサイトからダウンロードしてください．

[nkf.exe nkf32.dll Windows用](http://www.vector.co.jp/soft/dl/win95/util/se295331.html)

解答すると```vc2005\win32(98,Me,NT,2000,XP,Vista,7)Windows-31J```というディレクトリが見つかります．この中の```nkfwin32.exe```を```nkf.exe```に変更し，System32へ入れるか，パスを通してください．