package ${packageName}.base;

import android.os.Bundle;
import android.os.PersistableBundle;
import ${superClassFqcn};
import butterknife.ButterKnife;

/**
 * Created by zhonghang on 2016/10/4.
 */

public abstract  class BaseActivity extends ${superClass} {

    @Override
    public void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(getLayoutId());
        ButterKnife.bind(this);
    }
    public abstract  int getLayoutId();
}
