package ${packageName};

import rx.subscriptions.CompositeSubscription;

/**
 * Created by zhonghang on 2016/10/9.
 */

public class ${presenterClass} implements ${contractClass}.Presenter {
    private ${contractClass}.View mView;
    private ${contractClass}.Modle mModle;
    private CompositeSubscription compositeSubscription;
    public ${presenterClass}() {

    }

    @Override
    public void detachView() {
          //此处用于销毁网络连接，或者查询数据库的操作，耗时操作导致view不能被正常回收导致内存泄漏
          compositeSubscription.clear();
    }

    @Override
    public void attachView(${contractClass}.View view) {
      mView=view;
      this.mModle = new ${modleClass}();
      compositeSubscription = new CompositeSubscription();
    }
}
