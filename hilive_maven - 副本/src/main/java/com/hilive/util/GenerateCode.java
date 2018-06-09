package com.hilive.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.util.Random;

/**
 * Created by ttc on 18-4-9.
 */
public class GenerateCode {
    //设置验证图片的宽度, 高度, 验证码的个数
    private int width = 152;
    private int height = 40;

    //验证码字体的高度
    private int fontHeight = 38;

    //验证码中的单个字符基线. 即：验证码中的单个字符位于验证码图形左上角的 (codeX, codeY) 位置处
    private int codeX = 25;//width / (codeCount + 2);
    private int codeY = 36;

    public BufferedImage Generate(String code) {
        //定义一个类型为 BufferedImage.TYPE_INT_BGR 类型的图像缓存
        BufferedImage buffImg = null;
        buffImg = new BufferedImage(width, height, BufferedImage.TYPE_3BYTE_BGR);

        //在 buffImg 中创建一个 Graphics2D 图像
        Graphics2D graphics = null;
        graphics = buffImg.createGraphics();

        //设置一个颜色, 使 Graphics2D 对象的后续图形使用这个颜色
        graphics.setColor(Color.WHITE);

        //填充一个指定的矩形: x - 要填充矩形的 x 坐标; y - 要填充矩形的 y 坐标; width - 要填充矩形的宽度; height - 要填充矩形的高度
        graphics.fillRect(0, 0, width, height);

        //创建一个 Font 对象: name - 字体名称; style - Font 的样式常量; size - Font 的点大小
        Font font = null;
        font = new Font("", Font.BOLD, fontHeight);
        //使 Graphics2D 对象的后续图形使用此字体
        graphics.setFont(font);

        graphics.setColor(Color.BLACK);

        //绘制指定矩形的边框, 绘制出的矩形将比构件宽一个也高一个像素
        graphics.drawRect(0, 0, width - 1, height - 1);

        //随机产生 15 条干扰线, 使图像中的认证码不易被其它程序探测到
        Random random = null;
        random = new Random();
        graphics.setColor(Color.GREEN);
        for (int i = 0; i < 30; i++) {
            int x = random.nextInt(width);
            int y = random.nextInt(height);
            int x1 = random.nextInt(20);
            int y1 = random.nextInt(20);
            graphics.drawLine(x, y, x + x1, y + y1);
        }

        graphics.setColor(Color.BLACK);
        for (int i = 0; i < code.length(); i++) {

            //用随机产生的颜色将验证码绘制到图像中
//            graphics.setColor(Color.BLUE);
            graphics.drawString(String.valueOf(code.charAt(i)), (i + 1) * codeX, codeY);
        }

        return buffImg;
    }

}
