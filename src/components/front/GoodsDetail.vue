<template>
  <div class="goods-detail-container">
    <!-- 标题区域 -->
    <div class="page-header">
      <div class="header-content">
        <h1>商品详情</h1>
      </div>
    </div>

    <!-- 商品详情内容 -->
    <div class="goods-detail-content">
      <div v-if="!goodsInfo" class="no-data">
        <el-empty description="加载中..."></el-empty>
      </div>

      <div v-else-if="goodsInfo" class="detail-wrapper">
        <!-- 商品卡片 - 放大展示版 -->
        <div class="goods-grid-large">
          <el-row :gutter="30">
            <el-col :xs="24" :sm="24" :md="12" :lg="8" class="goods-detail-col">
              <div class="goods-card-large">
                <div class="goods-image">
                  <el-image 
                    :src="imgBaseUrl + '/' + goodsInfo.img" 
                    fit="cover"
                    :preview-src-list="[imgBaseUrl + '/' + goodsInfo.img]"
                  >
                    <div slot="error" class="image-slot">
                      <i class="el-icon-picture-outline"></i>
                    </div>
                  </el-image>
                  <div class="goods-tag">
                    <i class="el-icon-shopping-bag-2"></i>
                  </div>
                </div>

                <div class="goods-info">
                  <h3 class="goods-name">{{ goodsInfo.name }}</h3>
                  <el-tooltip v-if="goodsInfo.desrc && goodsInfo.desrc.length >= 40" 
                      :content="goodsInfo.desrc" 
                      placement="top" 
                      effect="light"
                  >
                    <p class="goods-desc">{{ goodsInfo.desrc }}</p>
                  </el-tooltip>
                  <p v-else class="goods-desc">{{ goodsInfo.desrc }}</p>

                  <div class="goods-meta">
                    <div class="price-section">
                      <span class="price">{{ goodsInfo.price | currency }}</span>
                      <span class="unit">/ 份</span>
                    </div>
                    <div class="stock">库存: {{ goodsInfo.num }}</div>
                  </div>

                  <div class="purchase-section">
                    <el-input-number 
                      v-model="buyNum" 
                      :min="0" 
                      :max="goodsInfo.num"
                      size="small"
                      controls-position="right"
                      placeholder="0"
                    ></el-input-number>
                     
                    <div class="total-price">
                      总价: <span>{{ (goodsInfo.price * (buyNum || 0)) | currency }}</span>
                    </div>
                  </div>

                  <div class="action-section">
                    <p v-if="userInfo.role!='USER'" class="admin-tip">
                      <i class="el-icon-warning-outline"></i>
                      管理员不可购买商品
                    </p>
                    <el-button 
                      type="primary" 
                      round
                      :disabled="userInfo.role!='USER' || buyNum <= 0 || buyNum > goodsInfo.num"
                      @click="addToCart"
                    >
                      <i class="el-icon-shopping-cart-2"></i>
                      立即购买
                    </el-button>
                  </div>
                </div>
              </div>
            </el-col>
          </el-row>
        </div>
      </div>

      <div v-else class="no-data">
        <el-empty description="暂无商品信息"></el-empty>
      </div>
    </div>
  </div>
</template>

<script>
import request from '@/utils/request';
export default {
  name: 'GoodsDetail',
  inject: ['userInfo'],
  data() {
    return {
      goodsId: this.$route.params.id,
      goodsInfo: null,
      buyNum: 0,
      imgBaseUrl: this.HOST,
      orderInfo: {
        goodsId: undefined,
        num: undefined,
        userId: this.userInfo.id
      }
    };
  },
  created() {
    this.fetchData();
  },
  methods: {
    fetchData() {
      request.get(`/goods/${this.goodsId}`).then(response => {
        if (response.code === '0') {
          this.goodsInfo = response.data;
        } else {
          this.$message.error('获取商品详情失败');
        }
      })
    },
    addToCart() {
      if (!this.buyNum || this.buyNum === 0) {
        this.$message({
          type: 'warning',
          message: '请选择购买数量!',
        })
        return;
      }
      if (this.buyNum > this.goodsInfo.num) {
        this.$message.warning('购买数量不能超过库存');
        return;
      }

      this.orderInfo.goodsId = this.goodsId;
      this.orderInfo.num = this.buyNum;

      request.post('/orders', this.orderInfo).then(res => {
        if (res.code === '0') {
          this.$message.success('订单创建成功!');
        } else {
          this.$message.error('订单创建失败!');
        }
      });
    }
  },
  filters: {
    // 货币格式化过滤器
    currency(value) {
      return '¥' + parseFloat(value).toFixed(2);
    },
  },
};
</script>

<style lang="less" scoped>
.goods-detail-container {
  min-height: 100vh;
  background: linear-gradient(135deg, #5aaa95 0%, #88b04b 100%);
  padding: 0 0 40px 0;
}

.page-header {
  padding: 30px 0;
  color: white;
  text-align: center;

  .header-content {
    h1 {
      font-size: 28px;
      margin: 0;
      font-weight: 600;
    }
  }
}

.goods-detail-content {
  max-width: 1200px;
  margin: 0 auto;
  padding: 20px;
}

.goods-grid-large {
  max-width: 800px;
  margin: 0 auto;
  padding: 0 20px;
}

.goods-detail-col {
  display: flex;
  justify-content: center;
}

.goods-card-large {
  background: white;
  border-radius: 16px;
  overflow: hidden;
  transition: all 0.3s ease;
  box-shadow: 0 4px 20px rgba(0,0,0,0.08);
  border: 1px solid rgba(220, 237, 193, 0.5);
  width: 100%;

  &:hover {
    transform: translateY(-8px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15);
    border-color: #a8e6cf;

    .goods-tag {
      background-color: #5aaa95;
    }
  }

  .goods-image {
    width: 100%;
    padding-top: 100%;
    position: relative;
    overflow: hidden;

    .el-image {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      transition: transform 0.3s;

      &:hover {
        transform: scale(1.05);
      }
    }

    .goods-tag {
      position: absolute;
      top: 20px;
      right: 20px;
      width: 50px;
      height: 50px;
      border-radius: 50%;
      background-color: #88b04b;
      display: flex;
      justify-content: center;
      align-items: center;
      color: white;
      transition: all 0.3s ease;
      box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15);
      z-index: 10;
      cursor: pointer;
      
      i {
        font-size: 24px;
      }
    }
  }

  .goods-info {
    padding: 30px;

    .goods-name {
      font-size: 26px;
      font-weight: 600;
      margin: 0 0 16px;
      color: #303133;
    }

    .goods-desc {
      color: #606266;
      font-size: 16px;
      margin: 0 0 24px;
      line-height: 1.6;
      height: 80px;
      overflow: hidden;
      text-overflow: ellipsis;
      display: -webkit-box;
      -webkit-line-clamp: 4;
      -webkit-box-orient: vertical;
    }

    .goods-meta {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 24px;
      padding: 20px 0;
      border-top: 1px solid #f0f0f0;
      border-bottom: 1px solid #f0f0f0;

      .price-section {
        .price {
          color: #5aaa95;
          font-size: 32px;
          font-weight: 600;
        }
        .unit {
          color: #909399;
          font-size: 16px;
          margin-left: 6px;
        }
      }

      .stock {
        color: #88b04b;
        font-size: 16px;
      }
    }

    .purchase-section {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 24px;

      .el-input-number {
        width: 180px;
      }

      .total-price {
        color: #606266;
        font-size: 18px;

        span {
          color: #5aaa95;
          font-weight: 600;
          font-size: 22px;
        }
      }
    }

    .action-section {
      text-align: right;

      .admin-tip {
        color: #ff9800;
        font-size: 14px;
        margin: 0 0 16px;

        i {
          margin-right: 6px;
        }
      }

      .el-button {
        padding: 12px 32px;
        font-size: 18px;
        background-color: #5aaa95;
        border-color: #5aaa95;
        
        i {
          margin-right: 8px;
          font-size: 16px;
        }

        &:hover, &:focus {
          background-color: #7bbeaa;
          border-color: #7bbeaa;
        }
      }
    }
  }
}

.no-data {
  text-align: center;
  padding: 100px 0;
}

@media screen and (max-width: 1200px) {
  .goods-grid-large {
    max-width: 600px;
  }
}

@media screen and (max-width: 768px) {
  .goods-detail-content {
    padding: 10px;
  }
  
  .goods-grid-large {
    padding: 0;
  }

  .goods-card-large {
    .goods-image {
      .goods-tag {
        width: 40px;
        height: 40px;
        top: 15px;
        right: 15px;
        
        i {
          font-size: 20px;
        }
      }
    }

    .goods-info {
      padding: 20px;

      .goods-name {
        font-size: 22px;
      }

      .goods-desc {
        height: 60px;
        -webkit-line-clamp: 3;
      }

      .goods-meta {
        flex-direction: column;
        align-items: flex-start;
        gap: 10px;
        margin-bottom: 16px;
      }

      .price {
        font-size: 28px;
      }

      .purchase-section {
        flex-direction: column;
        align-items: stretch;
        gap: 16px;
        margin-bottom: 16px;

        .el-input-number {
          width: 100%;
        }
      }

      .action-section {
        .el-button {
          width: 100%;
        }
      }
    }
  }
}

@media screen and (max-width: 480px) {
  .goods-card-large {
    .goods-info {
      .goods-name {
        font-size: 20px;
      }

      .goods-meta {
        padding: 15px 0;
      }

      .price {
        font-size: 24px;
      }

      .el-button {
        font-size: 16px;
        padding: 10px 24px;
      }
    }
  }
}
</style>