#!/bin/sh
TOOLS=tools
IN=EX_input
OUT_BOX=BOX_all
OUT_ICON=ICON_all

# Boxart
mkdir -p ${OUT_BOX}

magick mogrify -path ${OUT_BOX} -resize 128x128! -format bmp -define bmp:format=bmp3 -type truecolor -depth 8 ${IN}/*
{TOOLS}/stbconv_smallargs -t -5 -nm -gi 1001 ${OUT_BOX}/*.bmp
rm ${OUT_BOX}/*.bmp
{TOOLS}/renamecsv ${OUT_BOX}/ product_aw.csv
# pvr format: no mipmap, twiddled, rgb565, global index 1001

#Icon
mkdir -p ${OUT_ICON}

magick mogrify -path ${OUT_ICON} -resize 256x256! -format bmp -define bmp:format=bmp3 -type truecolor -depth 8 ${IN}/*
{TOOLS}/stbconv_smallargs -t -5 -nm -gi 1001 ${OUT_ICON}/*.bmp
rm ${OUT_ICON}/*.bmp
{TOOLS}/renamecsv ${OUT_ICON}/ product_aw.csv
# pvr format: no mipmap, twiddled, rgb565, global index 1001
