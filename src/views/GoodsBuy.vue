<template>
    <div class="goods-container">
        <!-- 头部横幅区域 -->
        <div class="banner-section">
            <div class="banner-content">
                <div class="banner-text">
                    <h1 class="banner-title">🛒 宠物用品商城</h1>
                    <p class="banner-subtitle">为您的爱宠提供优质生活</p>
                    <div class="banner-quote">
                        <i class="el-icon-quote"></i>
                        <p>用心呵护每一个毛孩子</p>
                    </div>
                </div>
                <div class="banner-decoration">
                    <div class="pet-icon dog"><i class="el-icon-shopping-bag-2"></i></div>
                    <div class="pet-icon cat"><i class="el-icon-pets"></i></div>
                </div>
            </div>
        </div>

        <!-- 主内容区 -->
        <div class="main-content">
            <!-- 左侧购买指南/温馨提示 -->
            <div class="sidebar">
                <!-- 购买指南卡片 -->
        <div class="guide-section">
            <div class="section-title">
                <i class="el-icon-book-2"></i>
                <span>购买指南</span>
            </div>
            <div class="guide-content">
                <div class="guide-item">
                    <div class="guide-number">1</div>
                    <div class="guide-text">
                        <h4>浏览与选择</h4>
                        <p>浏览商品列表，选择适合爱宠的优质用品</p>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-number">2</div>
                    <div class="guide-text">
                        <h4>确定数量</h4>
                        <p>根据需求选择合适的购买数量</p>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-number">3</div>
                    <div class="guide-text">
                        <h4>立即购买</h4>
                        <p>点击"立即购买"完成订单</p>
                    </div>
                </div>
                <div class="guide-item">
                    <div class="guide-number">4</div>
                    <div class="guide-text">
                        <h4>等待收货</h4>
                        <p>我们将尽快为您发货</p>
                    </div>
                </div>
            </div>
            
            <!-- 进度指示器 -->
            <div class="progress-guide">
              <div class="progress-title">购买流程进度</div>
              <div class="progress-steps">
                <div class="step active">
                  <div class="step-number">1</div>
                  <div class="step-text">选择商品</div>
                  <div class="step-line active"></div>
                </div>
                <div class="step">
                  <div class="step-number">2</div>
                  <div class="step-text">确认订单</div>
                  <div class="step-line"></div>
                </div>
                <div class="step">
                  <div class="step-number">3</div>
                  <div class="step-text">支付下单</div>
                  <div class="step-line"></div>
                </div>
                <div class="step">
                  <div class="step-number">4</div>
                  <div class="step-text">收货评价</div>
                </div>
              </div>
            </div>
        </div>

                <!-- 温馨提示 -->
                <div class="tips-section">
                    <div class="section-title">
                        <i class="el-icon-warning-outline"></i>
                        <span>温馨提示</span>
                    </div>
                    <div class="tips-content">
                        <p>• 请确保选择适合宠物年龄和体型的产品</p>
                        <p>• 食品类产品请注意保质期和过敏信息</p>
                        <p>• 如有特殊需求，请联系客服咨询</p>
                        <p>• 收到商品后请及时检查，如有问题可申请退换</p>
                    </div>
                </div>

                <!-- 用户评价展示 -->
                <div class="reviews-section">
                    <div class="section-title">
                        <i class="el-icon-star-on"></i>
                        <span>用户评价</span>
                    </div>
                    <div class="reviews-list">
                        <div class="review-item">
                            <div class="review-avatar">👩‍💼</div>
                            <div class="review-content">
                                <div class="review-name">李小姐</div>
                                <div class="review-date">2023-10-15</div>
                                <div class="review-rating">
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                </div>
                                <div class="review-text">商品质量很好，我家猫咪很喜欢！</div>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-avatar">👨‍💼</div>
                            <div class="review-content">
                                <div class="review-name">张先生</div>
                                <div class="review-date">2023-10-10</div>
                                <div class="review-rating">
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                </div>
                                <div class="review-text">物流很快，包装精美，非常满意！</div>
                            </div>
                        </div>
                        <div class="review-item">
                            <div class="review-avatar">👵</div>
                            <div class="review-content">
                                <div class="review-name">王奶奶</div>
                                <div class="review-date">2023-09-28</div>
                                <div class="review-rating">
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                    <i class="el-icon-star-on"></i>
                                </div>
                                <div class="review-text">客服态度很好，解答了我很多问题，产品也很不错</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- 右侧内容区 -->
            <div class="content-area">
                <!-- 搜索和操作区域 -->
                <div class="search-actions">
                    <div class="search-section">
                        <el-form :inline="true" :model="searchForm" class="search-form">
                            <el-form-item>
                                <el-input 
                                    v-model="searchForm.name" 
                                    placeholder="搜索商品名称"
                                    prefix-icon="el-icon-search"
                                    clearable
                                    class="search-input"
                                ></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" @click="fetchData" icon="el-icon-search" class="search-btn">搜索</el-button>
                                <el-button @click="reset" icon="el-icon-refresh" class="reset-btn">重置</el-button>
                            </el-form-item>
                        </el-form>
                    </div>
                </div>

                <!-- 商品统计展示 -->
                <div class="goods-stats">
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-shopping-bag-2"></i>
                        </div>
                        <div class="stat-number">{{ totalProducts }}</div>
                        <div class="stat-label">商品总数</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-success"></i>
                        </div>
                        <div class="stat-number">98%</div>
                        <div class="stat-label">好评率</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-truck"></i>
                        </div>
                        <div class="stat-number">48h</div>
                        <div class="stat-label">发货时间</div>
                    </div>
                </div>

                <!-- 商品列表 -->
                <div class="goods-grid">
                    <el-row :gutter="24">
                        <el-col :xs="24" :sm="12" :md="8" :lg="6" v-for="product in productList" :key="product.id">
                            <div class="goods-card">
                                <div class="goods-image-container">
                                    <div class="goods-image" @click="goToDetail(product.id)">
                                        <el-image 
                                            :src="imgBaseUrl + '/' + product.img" 
                                            fit="cover"
                                            class="product-img"
                                        >
                                            <div slot="error" class="image-slot">
                                                <i class="el-icon-picture-outline"></i>
                                            </div>
                                        </el-image>
                                        <div class="goods-badge" v-if="product.stock <= 10 && product.stock > 0">
                                            <span class="badge-text">仅剩{{ product.num }}件</span>
                                        </div>
                                        <div class="goods-badge hot" v-else-if="product.num > 10">
                                            <span class="badge-text">热卖</span>
                                        </div>
                                    </div>
                                </div>

                                <div class="goods-info">
                                    <h3 class="goods-name" @click="goToDetail(product.id)">{{ product.name }}</h3>
                                    <el-tooltip v-if="product.desrc && product.desrc.length >= 30" 
                                        :content="product.desrc" 
                                        placement="top" 
                                        effect="light"
                                    >
                                        <p class="goods-desc">{{ product.desrc }}</p>
                                    </el-tooltip>
                                    <p v-else class="goods-desc">{{ product.desrc }}</p>

                                    <div class="goods-meta">
                                        <div class="price-section">
                                            <span class="price">{{ product.price | currency }}</span>
                                            <span class="unit">/ 份</span>
                                        </div>
                                        <div class="stock" :class="{ 'low-stock': product.num <= 10 }">{{ product.num > 0 ? `库存: ${product.num}` : '缺货' }}</div>
                                    </div>

                                    <div class="purchase-section">
                                        <el-input-number 
                                            v-model="product.buyNum" 
                                            :min="0" 
                                            :max="product.num"
                                            :disabled="product.num === 0 || userInfo.role !== 'USER'"
                                            size="small"
                                            controls-position="right"
                                            placeholder="0"
                                        ></el-input-number>
                                         
                                        <div class="total-price">
                                            总价: <span>{{ (product.price * (product.buyNum || 0)) | currency }}</span>
                                        </div>
                                    </div>

                                    <div class="action-section">
                                        <p v-if="userInfo.role!='USER'" class="admin-tip">
                                            <i class="el-icon-warning-outline"></i>
                                            管理员不可购买商品
                                        </p>
                                        <el-button 
                                            type="primary" 
                                            :disabled="userInfo.role!='USER' || product.num === 0 || !product.buyNum || product.buyNum === 0"
                                            @click="addToCart(product)"
                                            class="buy-btn"
                                        >
                                            <i class="el-icon-shopping-cart-2"></i>
                                            {{ product.num === 0 ? '暂时缺货' : '立即购买' }}
                                        </el-button>
                                    </div>
                                </div>
                            </div>
                        </el-col>
                    </el-row>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import request from '@/utils/request';
export default {
    name: 'GoodsBuy',
    inject: ['userInfo'],
    created() {
        this.loadData();
    },

    data() {
        return {
            // 搜索表单数据
            searchForm: {
                name: ''
            },
            imgBaseUrl: this.HOST,
            orderInfo:{
                goodsId:undefined,
                num:undefined,
                userId:this.userInfo.id,
            },
            // 产品列表
            productList: [],
        };
    },
    computed: {
        totalProducts() {
            return this.productList.length;
        }
    },
    methods: {
        reset() {
            this.searchForm.name = '';
            // 添加重置动画效果
            const resetBtn = document.querySelector('.reset-btn');
            if (resetBtn) {
                resetBtn.classList.add('btn-spin');
                setTimeout(() => {
                    this.fetchData();
                    resetBtn.classList.remove('btn-spin');
                }, 300);
            } else {
                this.fetchData();
            }
        },
        fetchData() {
            // 添加搜索动画效果
            const searchBtn = document.querySelector('.search-btn');
            if (searchBtn) {
                searchBtn.classList.add('btn-loading');
                setTimeout(() => {
                    this.loadData();
                    searchBtn.classList.remove('btn-loading');
                }, 300);
            } else {
                this.loadData();
            }
        },
        loadData() {
            request.get("/goods", {
                params: {
                    name: this.searchForm.name,
                }
            }).then(response => {
                if (response.code === '0') {
                    // 为每个商品添加默认的购买数量
                    this.productList = response.data.map(item => ({
                        ...item,
                        buyNum: 0
                    }))
                }
            })
        },
        // 跳转到商品详情
        goToDetail(id) {
            this.$router.push({ name: 'goodsDetail', params: { id } });
        },
        


        // 添加到购物车
        addToCart(product) {
            this.orderInfo.num = product.buyNum;
            this.orderInfo.goodsId = product.id;

            request.post("/orders", this.orderInfo).then(res => {
                if(res.code == '0') {
                    this.$message({
                        type: 'success',
                        message: '订单创建成功!',
                    });
                    // 重置购买数量
                    product.buyNum = 0;
                } else {
                    this.$message({
                        type: 'error',
                        message: '订单创建失败!',
                    });
                }
            })
        },
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
.goods-container {
    min-height: 100vh;
    background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
    padding: 0 0 60px 0;
}

/* 头部横幅样式 */
.banner-section {
    background: linear-gradient(135deg, #ff6b6b, #ee5a6f);
    color: white;
    padding: 40px 0;
    box-shadow: 0 4px 12px rgba(255, 107, 107, 0.3);
    overflow: hidden;
    position: relative;
    z-index: 1;
}

.banner-content {
    display: flex;
    justify-content: space-between;
    align-items: center;
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    position: relative;
}

.banner-text {
    z-index: 2;
}

.banner-title {
    font-size: 2.5rem;
    margin-bottom: 10px;
    font-weight: bold;
    text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.2);
    display: flex;
    align-items: center;
    gap: 15px;
}

.banner-subtitle {
    font-size: 1.2rem;
    opacity: 0.9;
    margin-bottom: 20px;
}

.banner-quote {
    display: flex;
    align-items: center;
    background: rgba(255, 255, 255, 0.1);
    padding: 12px 18px;
    border-radius: 25px;
    font-style: italic;
    backdrop-filter: blur(5px);
}

.banner-quote i {
    margin-right: 10px;
    font-size: 1.2rem;
}

.banner-decoration {
    display: flex;
    gap: 30px;
}

.pet-icon {
    width: 80px;
    height: 80px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 2.5rem;
    animation: float 3s ease-in-out infinite;
    backdrop-filter: blur(5px);
}

.pet-icon.dog {
    animation-delay: 0s;
}

.pet-icon.cat {
    animation-delay: 1s;
}

@keyframes float {
    0%, 100% { transform: translateY(0); }
    50% { transform: translateY(-20px); }
}

/* 主内容区 */
.main-content {
    max-width: 1200px;
    margin: 30px auto 0;
    padding: 0 20px;
    display: flex;
    gap: 30px;
}

/* 左侧边栏 */
.sidebar {
    flex: 0 0 300px;
    display: flex;
    flex-direction: column;
    gap: 25px;
}

/* 购买指南 */
.guide-section {
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 25px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 154, 158, 0.1);
    overflow: hidden;
    position: relative;
}

.guide-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 35px rgba(255, 154, 158, 0.15);
}

/* 卡片装饰元素 */
.guide-section::before {
    content: '';
    position: absolute;
    top: -50px;
    right: -50px;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background: rgba(255, 154, 158, 0.05);
    transition: all 0.3s ease;
    z-index: 1;
}

.guide-section:hover::before {
    transform: scale(1.2);
    background: rgba(255, 154, 158, 0.08);
}

.section-title {
    display: flex;
    align-items: center;
    margin-bottom: 20px;
    padding-bottom: 15px;
    border-bottom: 2px solid rgba(255, 154, 158, 0.1);
    position: relative;
    z-index: 2;
    font-size: 18px;
    font-weight: bold;
    color: #333;
}

.section-title i {
    font-size: 22px;
    color: #ff7d7f;
    margin-right: 10px;
    transition: transform 0.3s ease;
}

.guide-section:hover .section-title i {
    transform: scale(1.1) rotate(5deg);
}

.section-title::after {
    content: '';
    position: absolute;
    bottom: -17px;
    left: 0;
    width: 40px;
    height: 2px;
    background: linear-gradient(90deg, #ff7d7f 0%, #ff9a9e 100%);
    border-radius: 2px;
}

.guide-content {
    display: flex;
    flex-direction: column;
    gap: 18px;
    position: relative;
    z-index: 2;
}

.guide-item {
    display: flex;
    align-items: flex-start;
    gap: 15px;
    padding: 15px;
    background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
    border-radius: 12px;
    transition: all 0.3s ease;
    border-left: 4px solid transparent;
}

.guide-item:hover {
    transform: translateX(8px);
    border-left-color: #ff7d7f;
    box-shadow: 0 4px 15px rgba(255, 154, 158, 0.1);
}

.guide-number {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
    color: #fff;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    flex-shrink: 0;
    box-shadow: 0 4px 12px rgba(255, 154, 158, 0.3);
    transition: all 0.3s ease;
}

.guide-item:hover .guide-number {
    transform: scale(1.1);
    box-shadow: 0 6px 16px rgba(255, 154, 158, 0.4);
}

.guide-text {
    flex: 1;
}

.guide-text h4 {
    margin: 0 0 8px 0;
    font-size: 16px;
    font-weight: bold;
    color: #303133;
    transition: color 0.3s ease;
}

.guide-item:hover .guide-text h4 {
    color: #ff7d7f;
}

.guide-text p {
    margin: 0;
    font-size: 14px;
    color: #606266;
    line-height: 1.6;
}

/* 进度指示器样式 */
.progress-guide {
    margin-top: 24px;
    padding-top: 20px;
    border-top: 1px solid rgba(255, 154, 158, 0.1);
    position: relative;
    z-index: 2;
}

.progress-title {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 20px;
    color: #303133;
    text-align: center;
}

.progress-steps {
    display: flex;
    align-items: center;
    justify-content: space-between;
}

.step {
    display: flex;
    flex-direction: column;
    align-items: center;
    flex: 1;
    position: relative;
    z-index: 2;
}

.step-number {
    width: 36px;
    height: 36px;
    border-radius: 50%;
    background: #f0f2f5;
    color: #606266;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    font-size: 16px;
    margin-bottom: 10px;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
}

.step-text {
    font-size: 12px;
    color: #606266;
    text-align: center;
    transition: all 0.3s ease;
    position: relative;
}

.step-line {
    position: absolute;
    top: 18px;
    left: 50%;
    right: 50%;
    height: 3px;
    background: #f0f2f5;
    z-index: 1;
    transition: all 0.3s ease;
}

.step.active .step-number {
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
    color: white;
    transform: scale(1.1);
    box-shadow: 0 4px 12px rgba(255, 154, 158, 0.4);
}

.step.active .step-text {
    color: #ff7d7f;
    font-weight: 600;
    font-size: 13px;
}

.step-line.active {
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
    height: 4px;
}

/* 温馨提示 */
.tips-section {
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 25px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 154, 158, 0.1);
    overflow: hidden;
    position: relative;
}

.tips-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 35px rgba(255, 154, 158, 0.15);
}

/* 卡片装饰元素 */
.tips-section::before {
    content: '';
    position: absolute;
    top: -50px;
    right: -50px;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background: rgba(255, 154, 158, 0.05);
    transition: all 0.3s ease;
    z-index: 1;
}

.tips-section:hover::before {
    transform: scale(1.2);
    background: rgba(255, 154, 158, 0.08);
}

.tips-content {
    font-size: 14px;
    line-height: 1.8;
    color: #606266;
    background: rgba(255, 235, 238, 0.3);
    padding: 16px;
    border-radius: 12px;
    border-left: 4px solid #ff7d7f;
    position: relative;
    z-index: 2;
}

.tips-content p {
    margin: 0 0 12px 0;
    position: relative;
    padding-left: 20px;
}

.tips-content p::before {
    content: '•';
    position: absolute;
    left: 0;
    color: #ff7d7f;
    font-weight: bold;
    font-size: 18px;
    line-height: 1;
}

.tips-content p:last-child {
    margin-bottom: 0;
}

/* 用户评价 */
.reviews-section {
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 25px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: all 0.3s ease;
    border: 1px solid rgba(255, 154, 158, 0.1);
    overflow: hidden;
    position: relative;
}

.reviews-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 35px rgba(255, 154, 158, 0.15);
}

/* 卡片装饰元素 */
.reviews-section::before {
    content: '';
    position: absolute;
    top: -50px;
    right: -50px;
    width: 200px;
    height: 200px;
    border-radius: 50%;
    background: rgba(255, 154, 158, 0.05);
    transition: all 0.3s ease;
    z-index: 1;
}

.reviews-section:hover::before {
    transform: scale(1.2);
    background: rgba(255, 154, 158, 0.08);
}

.reviews-list {
    display: flex;
    flex-direction: column;
    gap: 16px;
    position: relative;
    z-index: 2;
}

.review-item {
    display: flex;
    align-items: center;
    background: linear-gradient(135deg, #e8f5e9 0%, #c8e6c9 100%);
    padding: 16px;
    border-radius: 12px;
    transition: all 0.3s ease;
    box-shadow: 0 2px 8px rgba(102, 187, 106, 0.1);
    position: relative;
    overflow: hidden;
}

.review-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: linear-gradient(135deg, rgba(102, 187, 106, 0.1) 0%, rgba(129, 199, 132, 0.1) 100%);
    opacity: 0;
    transition: opacity 0.3s ease;
}

.review-item:hover {
    transform: translateX(8px) translateY(-2px);
    box-shadow: 0 4px 16px rgba(102, 187, 106, 0.2);
}

.review-item:hover::before {
    opacity: 1;
}

.review-avatar {
    font-size: 40px;
    margin-right: 16px;
    flex-shrink: 0;
    transition: transform 0.3s ease;
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: linear-gradient(135deg, #66bb6a 0%, #81c784 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
}

.review-item:hover .review-avatar {
    transform: scale(1.2) rotate(10deg);
}

.review-content {
    flex: 1;
}

.review-name {
    font-weight: 600;
    color: #2e7d32;
    margin-bottom: 4px;
    font-size: 16px;
}

.review-date {
    font-size: 12px;
    color: #66bb6a;
    margin-bottom: 6px;
    font-weight: 500;
}

.review-rating {
    color: #ffb74d;
    margin-bottom: 6px;
    font-weight: 500;
}

.review-rating i {
    font-size: 14px;
}

.review-text {
    font-size: 14px;
    color: #388e3c;
    font-style: italic;
    background: rgba(255, 255, 255, 0.6);
    padding: 8px 12px;
    border-radius: 8px;
    border-left: 3px solid #66bb6a;
}

/* 右侧内容区 */
.content-area {
    flex: 1;
    min-width: 0;
}

/* 搜索区域样式 */
.search-actions {
    background: #fff;
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 25px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
    gap: 20px;
}

.search-form {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 15px;
}

.search-form .el-form-item {
    margin-bottom: 0;
}

.search-input {
    width: 300px;
    border-radius: 8px;
    transition: border-color 0.3s ease, box-shadow 0.3s ease;
}

.search-input:focus {
    border-color: #ff7d7f;
    box-shadow: 0 0 0 2px rgba(255, 125, 127, 0.2);
}

.search-btn, .reset-btn {
    border-radius: 8px;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
    margin-left: 10px;
}

.search-btn {
    background: #ff7d7f;
    border-color: #ff7d7f;
}

.search-btn:hover {
    background: #ff6b6d;
    border-color: #ff6b6d;
    transform: translateY(-1px);
}

.reset-btn:hover {
    transform: translateY(-1px);
    color: #ff7e82;
    border-color: #ff7e82;
}

/* 按钮动画效果 */
.btn-loading {
    animation: pulse 1s infinite;
}

.btn-spin i {
    animation: spin 0.5s linear;
}

@keyframes pulse {
    0% { opacity: 1; }
    50% { opacity: 0.7; }
    100% { opacity: 1; }
}

@keyframes spin {
    from { transform: rotate(0deg); }
    to { transform: rotate(360deg); }
}

/* 响应式设计 */
@media screen and (max-width: 1024px) {
    .search-form {
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .search-input {
        width: 250px;
    }
}

@media screen and (max-width: 768px) {
    .search-form {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-input {
        width: 100%;
    }
}

/* 商品统计 */
.goods-stats {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
}

.stat-item {
    flex: 1;
    background: white;
    border-radius: 15px;
    padding: 25px;
    text-align: center;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.stat-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
}

.stat-icon {
    width: 60px;
    height: 60px;
    background: linear-gradient(135deg, #ff9a9e, #fad0c4);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 15px;
    color: white;
    font-size: 1.8rem;
}

.stat-number {
    font-size: 2rem;
    font-weight: bold;
    color: #ff6b6b;
    margin-bottom: 5px;
}

.stat-label {
    color: #666;
    font-size: 0.9rem;
}

/* 商品卡片 */
.goods-card {
    background: white;
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    margin-bottom: 30px;
    height: 100%;
    display: flex;
    flex-direction: column;
}

.goods-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 35px rgba(0, 0, 0, 0.15);
}

.goods-image-container {
    position: relative;
    overflow: hidden;
    height: 200px;
}

.goods-image {
    height: 100%;
    cursor: pointer;
    position: relative;
}

.product-img {
    width: 100%;
    height: 100%;
    transition: transform 0.5s ease;
}

.goods-card:hover .product-img {
    transform: scale(1.1);
}

.goods-badge {
    position: absolute;
    top: 15px;
    right: 15px;
    background: linear-gradient(135deg, #ff6b6b, #ee5a6f);
    color: white;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 0.8rem;
    font-weight: 600;
    z-index: 10;
}

.goods-badge.hot {
    background: linear-gradient(135deg, #ff9f43, #ff6348);
}

.goods-info {
    padding: 20px;
    flex: 1;
    display: flex;
    flex-direction: column;
}

.goods-name {
    font-size: 1.1rem;
    font-weight: 600;
    color: #333;
    margin-bottom: 10px;
    cursor: pointer;
    transition: color 0.3s ease;
}

.goods-name:hover {
    color: #ff6b6b;
}

.goods-desc {
    color: #666;
    font-size: 0.9rem;
    line-height: 1.5;
    margin-bottom: 15px;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    overflow: hidden;
    text-overflow: ellipsis;
}

.goods-meta {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.price-section {
    display: flex;
    align-items: baseline;
    gap: 5px;
}

.price {
    font-size: 1.4rem;
    font-weight: bold;
    color: #ff6b6b;
}

.unit {
    font-size: 0.9rem;
    color: #999;
}

.stock {
    font-size: 0.9rem;
    color: #666;
}

.stock.low-stock {
    color: #ff6b6b;
    font-weight: 600;
}

.purchase-section {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 15px;
}

.total-price {
    font-size: 1rem;
    color: #666;
}

.total-price span {
    color: #ff6b6b;
    font-weight: 600;
}

.action-section {
    margin-top: auto;
}

.admin-tip {
    color: #ff9800;
    font-size: 0.9rem;
    text-align: center;
    margin-bottom: 10px;
}

.buy-btn {
    width: 100%;
    border-radius: 25px !important;
    padding: 12px 0;
    background: linear-gradient(135deg, #4caf50, #45a049);
    border: none;
    font-size: 1rem;
    transition: all 0.3s ease;
}

.buy-btn:not(:disabled):hover {
    transform: translateY(-2px);
    box-shadow: 0 5px 15px rgba(76, 175, 80, 0.4);
    background: linear-gradient(135deg, #45a049, #3d8b40);
}

.buy-btn:disabled {
    background: #e0e0e0;
    color: #9e9e9e;
    cursor: not-allowed;
}

/* 响应式设计 */
@media (max-width: 1200px) {
    .main-content {
        flex-direction: column;
    }
    
    .sidebar {
        flex-direction: row;
        flex-wrap: wrap;
        flex: 1;
    }
    
    .guide-section,
    .tips-section,
    .reviews-section {
        flex: 1;
        min-width: 300px;
    }
}

@media (max-width: 768px) {
    .banner-content {
        flex-direction: column;
        text-align: center;
        padding: 20px;
    }
    
    .banner-title {
        font-size: 2rem;
        justify-content: center;
    }
    
    .banner-quote {
        justify-content: center;
        margin: 0 auto;
        width: fit-content;
    }
    
    .banner-decoration {
        margin-top: 30px;
    }
    
    .pet-icon {
        width: 60px;
        height: 60px;
        font-size: 2rem;
    }
    
    .search-actions {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-form {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-input {
        width: 100%;
    }
    
    .goods-stats {
        flex-direction: column;
    }
    
    .sidebar {
        flex-direction: column;
    }
    
    .guide-section,
    .tips-section,
    .reviews-section {
        width: 100%;
    }
}

@media (max-width: 480px) {
    .banner-section {
        padding: 30px 0;
    }
    
    .banner-title {
        font-size: 1.7rem;
    }
    
    .banner-subtitle {
        font-size: 1rem;
    }
    
    .main-content,
    .goods-card,
    .search-actions {
        padding: 15px;
    }
    
    .purchase-section {
        flex-direction: column;
        gap: 10px;
        align-items: stretch;
    }
    
    .total-price {
        text-align: right;
    }
}



</style>