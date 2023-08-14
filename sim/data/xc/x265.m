% 定义停车场中的禁止停车区域。指定颜色为白色，宽度比默认停车位的宽度小一米。绘制车位图。
noSpace = parkingSpace(Type="NoParking",Width=(space.Width - 1),MarkingColor="White");
plot(noSpace,Origin="off")