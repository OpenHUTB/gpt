% 定义停车场中要使用的无障碍停车位。指定一个宽度，比默认车位的宽度多一米。绘制车位图。
accessibleSpace = parkingSpace(Type="Accessible",Width=(space.Width + 1));
plot(accessibleSpace,Origin="off")