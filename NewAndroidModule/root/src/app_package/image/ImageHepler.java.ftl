package ${packageName}.image;

import android.content.Context;
import android.widget.ImageView;
import com.bumptech.glide.Glide;

/**
 * 用于配置加载图片的方式的类，这里默认使用的是Glide，如果替换成Fresco，只需要此处简单更改
 */

public class ImageHepler {
    public static void showImage(Context context, String url, ImageView view){
        Glide.with(context).load(url).into(view);
    }
}
