package ${packageName};

/**
 * Created by zhonghang on 2016/10/9.
 */

public class ${presenterClass} implements ${contractClass}.Presenter {
    private ${contractClass}.View mView;
    private ${contractClass}.Modle mModle;

    public ${presenterClass}(${contractClass}.View view) {
        this.mView = view;
        mModle = new ${modleClass}();
    }
}
