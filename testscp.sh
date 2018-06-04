#!/bin/bash
ssh dtiad01dma01p.dc.dotomi.net -n 8004Bbbs$ \
scp dtiad01dma01p.dc.dotomi.net:\
/tmp/test \
dtiad01dma02p.dc.dotomi.net:\
/tmp/ 
