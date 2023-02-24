#!/bin/sh

sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l11 num1/kassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l12 num1/kassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l21 num1/kassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l22 num1/kassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l11 num1/knassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l12 num1/knassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l21 num1/knassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l22 num1/knassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l11 num2/kassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l12 num2/kassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l21 num2/kassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l22 num2/kassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l11 num2/knassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l12 num2/knassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l21 num2/knassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l22 num2/knassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l11 num3/kassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l12 num3/kassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l21 num3/kassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l22 num3/kassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l11 num3/knassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l12 num3/knassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l21 num3/knassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l22 num3/knassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l11 num4/kassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l12 num4/kassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l21 num4/kassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_0 l22 num4/kassigned(l22, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l11 num4/knassigned(l11, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l12 num4/knassigned(l12, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l21 num4/knassigned(l21, num/g' plan.dot
sed -i 's/sensor-check__sensor__-obs0_DETDUP_1 l22 num4/knassigned(l22, num/g' plan.dot

dot plan.dot -Tpng > plan.png
