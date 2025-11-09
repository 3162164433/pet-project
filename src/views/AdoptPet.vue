<template>
    <div class="adopt-container">
        <!-- 头部横幅区域 -->
        <div class="banner-section">
            <div class="banner-content">
                <div class="banner-text">
                    <h1 class="banner-title">💕 宠物领养</h1>
                    <p class="banner-subtitle">每一个生命都值得被温柔以待</p>
                    <div class="banner-quote">
                        <i class="el-icon-quote"></i>
                        <p>领养代替购买，用爱温暖生命</p>
                    </div>
                </div>
                <div class="banner-decoration">
                    <div class="pet-icon dog"><i class="el-icon-dog"></i></div>
                    <div class="pet-icon cat"><i class="el-icon-cat"></i></div>
                </div>
            </div>
        </div>

        <!-- 主内容区 -->
        <div class="main-content">
            <!-- 左侧领养指南/温馨提示 -->
        <div class="sidebar">
            <!-- 领养指南卡片 -->
            <div class="guide-section">
                <div class="section-title">
                    <i class="el-icon-book-2"></i>
                    <span>领养指南</span>
                </div>
                <div class="guide-content">
                    <div class="guide-item">
                        <div class="guide-number">1</div>
                        <div class="guide-text">
                            <h4>浏览与选择</h4>
                            <p>浏览我们的宠物列表，找到您心仪的伙伴</p>
                        </div>
                    </div>
                    <div class="guide-item">
                        <div class="guide-number">2</div>
                        <div class="guide-text">
                            <h4>提交申请</h4>
                            <p>点击"去领养"按钮提交您的领养申请</p>
                        </div>
                    </div>
                    <div class="guide-item">
                        <div class="guide-number">3</div>
                        <div class="guide-text">
                            <h4>等待审核</h4>
                            <p>我们会尽快审核您的申请并与您联系</p>
                        </div>
                    </div>
                    <div class="guide-item">
                        <div class="guide-number">4</div>
                        <div class="guide-text">
                            <h4>领养回家</h4>
                            <p>审核通过后，您就可以带新伙伴回家了</p>
                        </div>
                    </div>
                </div>
                
                <!-- 进度指示器 -->
                <div class="progress-guide">
                    <div class="progress-title">领养流程</div>
                    <div class="progress-steps">
                        <div class="step active">
                            <div class="step-number">1</div>
                            <div class="step-text">提交申请</div>
                        </div>
                        <div class="step-line active"></div>
                        <div class="step">
                            <div class="step-number">2</div>
                            <div class="step-text">审核评估</div>
                        </div>
                        <div class="step-line"></div>
                        <div class="step">
                            <div class="step-number">3</div>
                            <div class="step-text">签订协议</div>
                        </div>
                        <div class="step-line"></div>
                        <div class="step">
                            <div class="step-number">4</div>
                            <div class="step-text">带回家</div>
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
                    <p>• 领养宠物是一项长期承诺，请确保您已准备好照顾它们的一生</p>
                    <p>• 请确保您有足够的时间、精力和财力来照顾宠物</p>
                    <p>• 请提前了解所领养宠物的品种特性和特殊需求</p>
                    <p>• 领养后请定期带宠物进行健康检查和接种疫苗</p>
                </div>
                
                <!-- 成本预估 -->
                <div class="cost-estimate">
                    <h4>养宠月均成本</h4>
                    <div class="cost-items">
                        <div class="cost-item">
                            <span class="cost-label">食物</span>
                            <span class="cost-value">¥300-800</span>
                        </div>
                        <div class="cost-item">
                            <span class="cost-label">医疗</span>
                            <span class="cost-value">¥200-500</span>
                        </div>
                        <div class="cost-item">
                            <span class="cost-label">用品</span>
                            <span class="cost-value">¥100-300</span>
                        </div>
                    </div>
                </div>
            </div>
            

            
            <!-- 成功案例展示 -->
            <div class="stories-section">
                <div class="section-title">
                    <i class="el-icon-success"></i>
                    <span>成功案例</span>
                </div>
                <div class="success-stories">
                    <div class="story-item">
                        <div class="story-avatar">🐱</div>
                        <div class="story-content">
                            <div class="story-name">小灰灰</div>
                            <div class="story-date">2023年10月领养</div>
                            <div class="story-quote">"感谢新主人给我的温暖家！"</div>
                        </div>
                    </div>
                    <div class="story-item">
                        <div class="story-avatar">🐶</div>
                        <div class="story-content">
                            <div class="story-name">旺财</div>
                            <div class="story-date">2023年8月领养</div>
                            <div class="story-quote">"现在我有了自己的沙发！"</div>
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
                                    placeholder="搜索宠物名称"
                                    prefix-icon="el-icon-search"
                                    clearable
                                    class="search-input"
                                ></el-input>
                            </el-form-item>
                            <el-form-item>
                                <el-select v-model="searchForm.type" placeholder="选择宠物类型" clearable class="search-select">
                                    <el-option label="猫" value="猫"></el-option>
                                    <el-option label="狗" value="狗"></el-option>
                                    <el-option label="其他" value="其他"></el-option>
                                </el-select>
                            </el-form-item>
                            <el-form-item>
                                <el-button type="primary" @click="handleSearch" icon="el-icon-search" class="search-btn">搜索</el-button>
                                <el-button @click="resetSearch" icon="el-icon-refresh" class="reset-btn">重置</el-button>
                            </el-form-item>
                        </el-form>
                    </div>

                    <!-- 我的申请按钮 -->
                    <div class="my-adopts" v-if="userInfo.role === 'USER'">
                        <el-button type="primary" @click="showMyAdopts" icon="el-icon-document" class="my-adopts-btn">
                            我的领养申请
                        </el-button>
                    </div>
                </div>

                <!-- 统计数据展示 -->
                <div class="pet-stats">
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-pets"></i>
                        </div>
                        <div class="stat-number">{{ stats.totalPets }}</div>
                        <div class="stat-label">待领养宠物</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-check"></i>
                        </div>
                        <div class="stat-number">{{ stats.adoptedPets }}</div>
                        <div class="stat-label">成功领养</div>
                    </div>
                    <div class="stat-item">
                        <div class="stat-icon">
                            <i class="el-icon-document-add"></i>
                        </div>
                        <div class="stat-number">{{ stats.applications }}</div>
                        <div class="stat-label">本月申请</div>
                    </div>
                </div>

                <!-- 宠物卡片区域 -->
                <div class="section-header">
                    <h2>等待你的毛孩子</h2>
                    <div class="section-divider"></div>
                </div>

                <div class="pet-grid">
                    <el-row :gutter="24">
                        <el-col :xs="24" :sm="12" :md="8" :lg="8" v-for="item in animalData" :key="item.id">
                            <div class="pet-card" @click="toDetail(item)" :class="{ 'special-card': item.id % 5 === 0 }">
                                <div class="pet-image">
                                    <el-image 
                                        :src="imgBaseUrl + item.img" 
                                        fit="cover"
                                        :preview-src-list="[imgBaseUrl + item.img]"
                                        class="pet-img"
                                    >
                                        <div slot="error" class="image-slot">
                                            <i class="el-icon-picture-outline"></i>
                                        </div>
                                    </el-image>
                                    <div class="pet-status" :class="getStatusClass(item.status)">
                                        {{ item.status }}
                                    </div>
                                    <div class="pet-badge" v-if="item.id % 5 === 0">特别推荐</div>
                                </div>

                                <div class="pet-info">
                                    <div class="pet-header">
                                        <h3 class="pet-name">{{ item.name }}</h3>
                                        <span class="pet-age">{{ item.age }}岁</span>
                                    </div>
                                    <div class="pet-tags">
                                        <span class="tag">{{ item.type }}</span>
                                        <span class="tag">{{ item.sex }}</span>
                                    </div>
                                    <p class="pet-desc">{{ item.descr }}</p>
                                    <div class="pet-actions">
                                        <el-button 
                                            class="adopt-btn"
                                            :type="getButtonType(item.status)"
                                            round
                                            @click.stop="handleAdopt(item.id)"
                                            :disabled="userInfo.role != 'USER' || !canAdopt(item.status)"
                                        >
                                            {{ adoptBtn(item.status) }}
                                        </el-button>
                                        <el-button 
                                            class="detail-btn"
                                            type="info"
                                            icon="el-icon-view"
                                            size="medium"
                                            @click.stop="toDetail(item)"
                                        >
                                            详情
                                        </el-button>
                                    </div>
                                </div>
                            </div>
                        </el-col>
                    </el-row>
                </div>

                <!-- 分页 -->
                <div class="pagination-container">
                    <el-pagination
                        background
                        @size-change="handleSizeChange"
                        @current-change="handleCurrentChange"
                        :current-page="pageParams.currentPage"
                        :page-sizes="[8, 9, 16, 24, 32]"
                        :page-size="pageParams.size"
                        layout="total, sizes, prev, pager, next, jumper"
                        :total="total"
                        class="pagination">
                    </el-pagination>
                </div>
            </div>
        </div>

        <!-- 底部信息区域 -->


        <!-- 我的领养申请对话框 -->
        <el-dialog 
            title="我的领养申请" 
            :visible.sync="myAdoptsVisible" 
            width="70%"
            custom-class="my-adopts-dialog"
            center
        >
            <div class="dialog-header">
                <h3>我的领养记录</h3>
                <p>请耐心等待审核，我们会尽快与您联系</p>
            </div>
            <el-table 
                :data="myAdopts" 
                v-loading="myAdoptsLoading" 
                stripe
                class="my-adopts-table"
                highlight-current-row
            >
                <el-table-column prop="animalName" label="宠物姓名" min-width="120"></el-table-column>
                <el-table-column prop="time" label="申请时间" min-width="160"></el-table-column>
                <el-table-column prop="status" label="状态" min-width="100">
                    <template slot-scope="scope">
                        <el-tag :type="getTagType(scope.row.status)" effect="dark" size="medium">{{ scope.row.status }}</el-tag>
                    </template>
                </el-table-column>
                <el-table-column prop="reviewComment" label="审核意见" show-overflow-tooltip min-width="200"></el-table-column>
                <el-table-column prop="reviewTime" label="审核时间" min-width="160"></el-table-column>
            </el-table>
        </el-dialog>
    </div>
</template>

<script>
import Request from '../utils/request.js'

export default {
    inject: ['userInfo'],
    data() {
        return {
            imgBaseUrl: this.HOST,
            animalData: [],
            total: 0,
            adoptedCount: 156, // 模拟数据
            happyStories: 238, // 模拟数据
            pageParams: {
                currentPage: 1,
                size: 9
            },
            searchForm: {
                name: '',
                type: ''
            },
            adoptForm: {
                id: '',
                userId: this.userInfo.id,
                animalId: ''
            },
            myAdoptsVisible: false,
            myAdoptsLoading: false,
            myAdopts: [],
            // 添加统计数据
            stats: {
                totalPets: 0,
                adoptedPets: 0,
                applications: 0
            }
        }
    },
    created() {
        this.loadAnimal()
        this.fetchAnimalStatistics()
        // 添加页面进入动画
        document.querySelector('.adopt-container').classList.add('page-enter')
    },
    methods: {
        // 根据状态获取按钮文本
        adoptBtn(status) {
            const statusMap = {
                '领养中': '已领养',
                '待领养': '去领养',
                '审核中': '审核中',
                '审核不通过': '重新申请'
            }
            return statusMap[status] || '去领养'
        },
        
        // 根据状态判断是否可领养
        canAdopt(status) {
            return status === '待领养' || status === '审核不通过'
        },
        
        // 根据状态获取按钮类型
        getButtonType(status) {
            const typeMap = {
                '领养中': 'info',
                '待领养': 'success',
                '审核中': 'warning',
                '审核不通过': 'danger'
            }
            return typeMap[status] || 'success'
        },
        
        // 根据状态获取标签类型
        getTagType(status) {
            const typeMap = {
                '领养中': 'success',
                '待领养': 'primary',
                '审核中': 'warning',
                '审核不通过': 'danger'
            }
            return typeMap[status] || 'info'
        },
        
        // 根据状态获取样式类
        getStatusClass(status) {
            const classMap = {
                '领养中': 'adopted',
                '审核中': 'pending',
                '审核不通过': 'rejected'
            }
            return classMap[status] || ''
        },
        
        // 显示我的领养申请
        showMyAdopts() {
            this.myAdoptsLoading = true
            this.myAdoptsVisible = true
            
            Request.get(`/adopt/user/${this.userInfo.id}`).then(res => {
                if (res.code === '0') {
                    this.myAdopts = res.data || []
                } else {
                    this.$message.error(res.msg || '获取领养申请失败')
                }
                this.myAdoptsLoading = false
            }).catch(() => {
                this.myAdoptsLoading = false
                this.$message.error('获取领养申请失败')
            })
        },
        
        // 获取宠物统计数据
        fetchAnimalStatistics() {
            // 获取所有宠物数据以统计数量
            Request.get('/animal/page', {
                params: {
                    pageNum: 1,
                    size: 1000 // 获取足够多的数据以确保统计准确
                }
            }).then(res => {
                if (res.code === '0') {
                    const allPets = res.data.records || []
                    
                    // 根据Animal.vue中的状态定义统计数量
                    // 待领养宠物数量
                    this.stats.totalPets = allPets.filter(pet => pet.status === '待领养').length
                    
                    // 成功领养数（仅领养中状态）
                    this.stats.adoptedPets = allPets.filter(pet => pet.status === '领养中').length
                    
                    // 本月申请的数量 = 当天号数翻倍 + 1-10随机数
                    const today = new Date();
                    const dayOfMonth = today.getDate();
                    const randomNum = Math.floor(Math.random() * 10) + 1;
                    this.stats.applications = (dayOfMonth * 2) + randomNum;
                }
            })
        },
        
        loadAnimal() {
            const params = {
                ...this.pageParams,
                ...this.searchForm
            }
            Request.get('/animal/page', { params }).then(res => {
                if (res.code === '0') {
                    // 添加数据加载动画效果
                    setTimeout(() => {
                        this.animalData = res.data.records
                        this.total = res.data.total
                    }, 300)
                } else {
                    this.$message.error(res.msg)
                }
            })
        },
        handleAdopt(animalId) {
            this.$confirm("确定要领养这只宠物吗？\n领养后需要您的长期陪伴与照顾。", "领养确认", {
                confirmButtonText: '确定领养',
                cancelButtonText: '再想想',
                type: 'primary',
                center: true
            }).then(() => {
                this.adoptForm.animalId = animalId
                Request.post("/adopt", this.adoptForm).then(res => {
                    if (res.code === '0') {
                        this.$message({
                            message: "领养申请提交成功，请等待管理员审核",
                            type: 'success',
                            duration: 2000
                        })
                        this.loadAnimal()
                        this.fetchAnimalStatistics() // 更新统计数据
                    } else {
                        this.$message.error(res.msg)
                    }
                })
            }).catch(() => {
                this.$message({
                    message: '已取消领养操作',
                    type: 'info',
                    duration: 1500
                })
            })
        },
        handleSearch() {
            this.pageParams.currentPage = 1
            // 添加搜索动画效果
            const searchBtn = document.querySelector('.search-btn')
            if (searchBtn) {
                searchBtn.classList.add('btn-loading')
                setTimeout(() => {
                    this.loadAnimal()
                    searchBtn.classList.remove('btn-loading')
                }, 300)
            } else {
                this.loadAnimal()
            }
        },
        resetSearch() {
            this.searchForm = {
                name: '',
                type: ''
            }
            // 添加重置动画效果
            const resetBtn = document.querySelector('.reset-btn')
            if (resetBtn) {
                resetBtn.classList.add('btn-spin')
                setTimeout(() => {
                    this.handleSearch()
                    resetBtn.classList.remove('btn-spin')
                }, 300)
            } else {
                this.handleSearch()
            }
        },
        handleSizeChange(val) {
            this.pageParams.size = val
            this.loadAnimal()
        },
        handleCurrentChange(val) {
            this.pageParams.currentPage = val
            this.loadAnimal()
        },
        toDetail(item) {
            // 添加页面过渡效果
            document.body.classList.add('page-transition')
            setTimeout(() => {
                this.$router.push({ 
                    name: 'petDetail', 
                    params: { id: item.id },
                    query: { _t: Date.now() }
                })
            }, 200)
        }
    }
}
</script>

<style lang="less" scoped>
/* 全局动画和过渡 */
.adopt-container {
    min-height: 100vh;
    background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
    padding: 0 0 40px 0;
    transition: opacity 0.5s ease, transform 0.5s ease;
}

/* 页面进入动画 */
.adopt-container.page-enter {
    animation: pageEnter 0.6s ease-out;
}

@keyframes pageEnter {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* 页面过渡效果 */
.page-transition {
    transition: opacity 0.3s ease;
    opacity: 0.8;
}

/* 头部横幅样式 */
.banner-section {
    background: linear-gradient(135deg, #ff9a9e 0%, #fad0c4 100%);
    color: #fff;
    padding: 60px 0 40px;
    position: relative;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
    margin-bottom: 0;
}

.banner-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 320"><path fill="rgba(255,255,255,0.1)" d="M0,224L80,213.3C160,203,320,181,480,181.3C640,181,800,203,960,208C1120,213,1280,203,1360,197.3L1440,192L1440,320L1360,320C1280,320,1120,320,960,320C800,320,640,320,480,320C320,320,160,320,80,320L0,320Z"></path></svg>');
    background-size: cover;
    background-position: bottom;
    z-index: 1;
}

.banner-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 20px;
    position: relative;
    z-index: 2;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.banner-text {
    max-width: 600px;
}

.banner-title {
    font-size: 42px;
    font-weight: bold;
    margin-bottom: 15px;
    text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.banner-subtitle {
    font-size: 18px;
    margin-bottom: 20px;
    opacity: 0.95;
}

.banner-quote {
    background: rgba(255, 255, 255, 0.2);
    padding: 15px 20px;
    border-radius: 10px;
    border-left: 4px solid #fff;
    display: flex;
    align-items: center;
}

.banner-quote i {
    font-size: 20px;
    margin-right: 10px;
}

.banner-quote p {
    margin: 0;
    font-style: italic;
}

.banner-decoration {
    position: relative;
}

.pet-icon {
    width: 120px;
    height: 120px;
    border-radius: 50%;
    background: rgba(255, 255, 255, 0.3);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 60px;
    position: absolute;
    animation: float 3s ease-in-out infinite;
}

.pet-icon.dog {
    top: -20px;
    right: 50px;
    animation-delay: 0s;
}

.pet-icon.cat {
    bottom: -30px;
    left: 50px;
    animation-delay: 1s;
}

@keyframes float {
    0% { transform: translateY(0px); }
    50% { transform: translateY(-20px); }
    100% { transform: translateY(0px); }
}

/* 主内容区样式 */
.main-content {
    max-width: 1200px;
    margin: 0 auto;
    padding: 30px 20px;
    display: flex;
    gap: 30px;
    position: relative;
    z-index: 10;
}

/* 侧边栏样式 */
.sidebar {
    width: 300px;
    flex-shrink: 0;
    position: sticky;
    top: 20px;
    align-self: flex-start;
}

.guide-section, .tips-section, .stories-section {
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

.guide-section:hover, .tips-section:hover, .stories-section:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 35px rgba(255, 154, 158, 0.15);
}

/* 卡片装饰元素 */
.guide-section::before, .tips-section::before, .stories-section::before {
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

.guide-section:hover::before, .tips-section:hover::before, .stories-section:hover::before {
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
}

.section-title i {
    font-size: 22px;
    color: #ff7d7f;
    margin-right: 10px;
    transition: transform 0.3s ease;
}

.guide-section:hover .section-title i, 
.tips-section:hover .section-title i, 
.stories-section:hover .section-title i {
    transform: scale(1.1) rotate(5deg);
}

.section-title span {
    font-size: 18px;
    font-weight: bold;
    color: #303133;
    position: relative;
}

.section-title span::after {
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

/* 成本预估样式 */
.cost-estimate {
    margin-top: 24px;
    padding: 20px;
    background: linear-gradient(135deg, #f0f7ff 0%, #e6f7ff 100%);
    border-radius: 12px;
    position: relative;
    z-index: 2;
    transition: all 0.3s ease;
}

.cost-estimate:hover {
    transform: translateY(-2px);
    box-shadow: 0 4px 16px rgba(64, 158, 255, 0.15);
}

.cost-estimate h4 {
    margin: 0 0 16px 0;
    font-size: 16px;
    font-weight: 600;
    color: #1976d2;
    text-align: center;
    position: relative;
}

.cost-estimate h4::after {
    content: '';
    position: absolute;
    bottom: -8px;
    left: 50%;
    transform: translateX(-50%);
    width: 40px;
    height: 3px;
    background: linear-gradient(135deg, #409eff 0%, #66b1ff 100%);
    border-radius: 3px;
}

.cost-items {
    display: flex;
    flex-direction: column;
    gap: 14px;
}

.cost-item {
    display: flex;
    justify-content: space-between;
    align-items: center;
    font-size: 14px;
    padding: 10px 0;
    border-bottom: 1px dashed rgba(64, 158, 255, 0.2);
    transition: all 0.3s ease;
}

.cost-item:last-child {
    border-bottom: none;
}

.cost-item:hover {
    transform: translateX(5px);
}

.cost-label {
    color: #606266;
    font-weight: 500;
}

.cost-value {
    font-weight: 600;
    color: #1976d2;
    font-size: 15px;
    background: rgba(25, 118, 210, 0.1);
    padding: 4px 8px;
    border-radius: 6px;
}

/* 成功案例样式 */
.success-stories {
    display: flex;
    flex-direction: column;
    gap: 16px;
    position: relative;
    z-index: 2;
}

.story-item {
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

.story-item::before {
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

.story-item:hover {
    transform: translateX(8px) translateY(-2px);
    box-shadow: 0 4px 16px rgba(102, 187, 106, 0.2);
}

.story-item:hover::before {
    opacity: 1;
}

.story-avatar {
    font-size: 40px;
    margin-right: 16px;
    flex-shrink: 0;
    transition: transform 0.3s ease;
}

.story-item:hover .story-avatar {
    transform: scale(1.2) rotate(10deg);
}

.story-content {
    flex: 1;
}

.story-name {
    font-weight: 600;
    color: #2e7d32;
    margin-bottom: 4px;
    font-size: 16px;
}

.story-date {
    font-size: 12px;
    color: #66bb6a;
    margin-bottom: 6px;
    font-weight: 500;
}

.story-quote {
    font-size: 14px;
    color: #388e3c;
    font-style: italic;
    background: rgba(255, 255, 255, 0.6);
    padding: 8px 12px;
    border-radius: 8px;
    border-left: 3px solid #66bb6a;
}

/* 右侧内容区样式 */
.content-area {
    flex: 1;
}

/* 搜索区域样式 */
.search-section {
    background: #fff;
    border-radius: 16px;
    padding: 25px;
    margin-bottom: 25px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    max-width: 100%;
    margin-left: 0;
    margin-right: 0;
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

.search-select {
    width: 150px;
    border-radius: 8px;
    transition: border-color 0.3s ease;
}

.search-select:focus {
    border-color: #ff7d7f;
}

.search-btn, .reset-btn {
    border-radius: 8px;
    transition: all 0.3s ease;
    position: relative;
    overflow: hidden;
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

/* 我的申请按钮 */
.my-adopts {
    text-align: right;
    margin-bottom: 25px;
    position: relative;
    z-index: 10;
}

.my-adopts-btn {
    background: #4ecdc4;
    border-color: #4ecdc4;
    border-radius: 8px;
    transition: all 0.3s ease;
}

.my-adopts-btn:hover {
    background: #44bdb7;
    border-color: #44bdb7;
    transform: translateY(-1px);
}

/* 宠物数量统计 */
.pet-stats {
    display: flex;
    gap: 20px;
    margin-bottom: 30px;
}

.stat-item {
    flex: 1;
    background: #fff;
    border-radius: 16px;
    padding: 25px;
    text-align: center;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    position: relative;
    overflow: hidden;
    background: linear-gradient(135deg, #fff 0%, #f8f9fa 100%);
    border: 1px solid rgba(255, 154, 158, 0.1);
}

/* 统计项悬停效果 */
.stat-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 100%;
    height: 4px;
    background: linear-gradient(90deg, #ff9a9e 0%, #fad0c4 100%);
    transition: right 0.5s ease;
    z-index: 1;
}

.stat-item:hover::before {
    right: 0;
}

.stat-item:hover {
    transform: translateY(-5px);
    box-shadow: 0 12px 30px rgba(255, 154, 158, 0.15);
}

/* 统计图标 */
.stat-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    background: linear-gradient(135deg, #ffecec 0%, #ffe6e6 100%);
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto 15px;
    font-size: 28px;
    color: #ff7d7f;
    box-shadow: 0 4px 15px rgba(255, 154, 158, 0.15);
    transition: all 0.3s ease;
}

.stat-item:nth-child(1) .stat-icon {
    background: linear-gradient(135deg, #ffecec 0%, #ffe6e6 100%);
    color: #ff7d7f;
}

.stat-item:nth-child(2) .stat-icon {
    background: linear-gradient(135deg, #e8f5e9 0%, #f1f8e9 100%);
    color: #66bb6a;
}

.stat-item:nth-child(3) .stat-icon {
    background: linear-gradient(135deg, #e3f2fd 0%, #e1f5fe 100%);
    color: #42a5f5;
}

.stat-item:hover .stat-icon {
    transform: scale(1.1) rotate(5deg);
    box-shadow: 0 6px 20px rgba(255, 154, 158, 0.2);
}

/* 统计数字和标签 */
.stat-number {
    font-size: 36px;
    font-weight: bold;
    color: #303133;
    margin-bottom: 8px;
    font-family: 'Arial', sans-serif;
    animation: countUp 2s ease-out;
}

.stat-label {
    font-size: 14px;
    color: #606266;
    font-weight: 500;
    letter-spacing: 0.5px;
}

/* 数字增长动画 */
@keyframes countUp {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* 区域标题样式 */
.section-header {
    margin-bottom: 30px;
    position: relative;
}

.section-header h2 {
    font-size: 24px;
    font-weight: bold;
    color: #303133;
    margin-bottom: 15px;
    position: relative;
    display: inline-block;
}

.section-divider {
    height: 3px;
    background: linear-gradient(90deg, #ff7d7f 0%, #ff9a9e 100%);
    border-radius: 1.5px;
    width: 100px;
}

/* 宠物卡片样式 */
.pet-grid {
    max-width: 100%;
    margin: 0;
    padding: 0;
}

.pet-card {
    background: #fff;
    border-radius: 16px;
    overflow: hidden;
    margin-bottom: 24px;
    cursor: pointer;
    transition: all 0.3s ease;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
    position: relative;
    background: linear-gradient(135deg, #ffffff 0%, #f8f9fa 100%);
    border: 2px solid rgba(255, 154, 158, 0.3);
    display: flex;
    flex-direction: column;
    min-height: 450px;
}

/* 卡片悬停效果 */
.pet-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 15px 30px rgba(255, 154, 158, 0.15);
}

.pet-card.special-card {
    border: 2px solid #ffbe0b;
    position: relative;
    overflow: visible;
}

.pet-image {
    position: relative;
    width: 100%;
    padding-top: 80%;
    overflow: hidden;
    background: linear-gradient(135deg, #f5f5f5 0%, #eeeeee 100%);
}

.pet-image .el-image {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.pet-card:hover .pet-image .el-image {
    transform: scale(1.05);
}

.pet-status {
    position: absolute;
    top: 15px;
    left: 15px;
    padding: 6px 12px;
    border-radius: 20px;
    font-size: 13px;
    color: white;
    font-weight: bold;
    z-index: 2;
    box-shadow: 0 2px 8px rgba(0,0,0,0.15);
    backdrop-filter: blur(5px);
}

.pet-status.adopted {
    background: linear-gradient(135deg, #66bb6a 0%, #81c784 100%);
}

.pet-status.pending {
    background: linear-gradient(135deg, #ffa726 0%, #ffb74d 100%);
}

.pet-status.rejected {
    background: linear-gradient(135deg, #ef5350 0%, #e57373 100%);
}

.pet-status {
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
}

.pet-badge {
    position: absolute;
    top: 20px;
    right: -40px;
    background: linear-gradient(45deg, #ffbe0b 0%, #fb5607 100%);
    color: #fff;
    padding: 5px 40px;
    font-size: 12px;
    font-weight: bold;
    transform: rotate(45deg);
    z-index: 3;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    animation: pulse-glow 2s ease-in-out infinite;
}

/* 脉冲发光动画 */
@keyframes pulse-glow {
    0% {
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
    50% {
        box-shadow: 0 2px 20px rgba(255, 190, 11, 0.5);
    }
    100% {
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
    }
}

.pet-info {
    padding: 20px;
    flex: 1;
    display: flex;
    flex-direction: column;
}

.pet-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 12px;
}

.pet-header h3 {
    margin: 0;
    font-size: 20px;
    color: #303133;
    font-weight: 600;
    transition: color 0.3s ease;
}

.pet-card:hover .pet-header h3 {
    color: #ff7d7f;
}

.pet-age {
    background: linear-gradient(135deg, #ffebee 0%, #ffcdd2 100%);
    color: #e53935;
    padding: 3px 10px;
    border-radius: 15px;
    font-size: 13px;
    font-weight: 500;
}

.pet-tags {
    margin-bottom: 12px;
}

.pet-tags .tag {
    display: inline-block;
    padding: 4px 10px;
    margin-right: 8px;
    margin-bottom: 8px;
    background: linear-gradient(135deg, #e3f2fd 0%, #bbdefb 100%);
    color: #1976d2;
    border-radius: 15px;
    font-size: 13px;
    transition: all 0.3s ease;
    border: none;
    font-weight: 500;
}

.pet-card:hover .pet-tags .tag {
    background: linear-gradient(135deg, #1976d2 0%, #42a5f5 100%);
    color: white;
    transform: translateY(-2px);
}

.pet-desc {
    color: #606266;
    font-size: 14px;
    line-height: 1.6;
    height: 45px;
    overflow: hidden;
    text-overflow: ellipsis;
    display: -webkit-box;
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    margin-bottom: auto;
    padding-bottom: 16px;
}

.pet-actions {
    display: flex;
    gap: 10px;
    margin-top: 16px;
}

.adopt-btn, .detail-btn {
    flex: 1;
    border-radius: 8px;
    transition: all 0.3s ease;
    font-weight: 500;
    padding: 12px 8px;
    font-size: 14px;
}

.adopt-btn {
    font-weight: bold;
    letter-spacing: 0.5px;
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
    border: none;
}

.adopt-btn:hover:not(:disabled) {
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(255, 125, 127, 0.3);
    background: linear-gradient(135deg, #ff6b6d 0%, #ff8a8e 100%);
}

.detail-btn {
    background: linear-gradient(135deg, #f5f5f5 0%, #e0e0e0 100%);
    border: none;
    color: #606266;
}

.detail-btn:hover {
    background: linear-gradient(135deg, #e0e0e0 0%, #bdbdbd 100%);
    color: #333;
    transform: translateY(-2px);
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

/* 分页样式 */
.pagination-container {
    max-width: 100%;
    margin: 40px auto 0;
    padding: 25px;
    background: white;
    border-radius: 16px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
}

.pagination {
    display: flex;
    justify-content: center;
}

.pagination .el-pagination__sizes .el-input .el-input__inner {
    border-radius: 6px;
}

.pagination .el-pagination__btn-next, 
.pagination .el-pagination__btn-prev {
    border-radius: 6px;
    transition: all 0.3s ease;
}

.pagination .el-pagination__btn-next:hover, 
.pagination .el-pagination__btn-prev:hover {
    transform: translateY(-1px);
}

.pagination .el-pager li {
    border-radius: 6px;
    transition: all 0.3s ease;
}

.pagination .el-pager li:hover:not(.disabled):not(.active) {
    transform: translateY(-1px);
}

.pagination .el-pager li.active {
    background: #ff7d7f;
    border-color: #ff7d7f;
}



/* 对话框样式 */
.my-adopts-dialog {
    border-radius: 16px;
    overflow: hidden;
}

.my-adopts-dialog .el-dialog__header {
    background: linear-gradient(135deg, #ff7d7f 0%, #ff9a9e 100%);
    padding: 25px;
    margin: 0;
}

.my-adopts-dialog .el-dialog__title {
    color: #fff;
    font-size: 20px;
    font-weight: bold;
}

.my-adopts-dialog .el-dialog__headerbtn .el-dialog__close {
    color: #fff;
    font-size: 20px;
}

.dialog-header {
    text-align: center;
    margin-bottom: 20px;
}

.dialog-header h3 {
    margin: 0 0 8px 0;
    font-size: 18px;
    font-weight: bold;
    color: #303133;
}

.dialog-header p {
    margin: 0;
    color: #606266;
    font-size: 14px;
}

.my-adopts-table {
    border-radius: 8px;
    overflow: hidden;
}

.my-adopts-table .el-table__header-wrapper th {
    background: #f8f9fa;
    font-weight: bold;
    color: #303133;
}

.my-adopts-table .el-table__body tr:hover > td {
    background: #fff5f5;
}

/* 响应式设计 */
@media screen and (max-width: 1024px) {
    .banner-content {
        flex-direction: column;
        text-align: center;
        gap: 40px;
    }
    
    .pet-icon {
        position: relative;
        top: 0 !important;
        right: 0 !important;
        bottom: 0 !important;
        left: 0 !important;
        margin: 0 20px;
    }
    
    .main-content {
        flex-direction: column;
        padding: 20px 15px;
    }
    
    .sidebar {
        width: 100%;
        margin-bottom: 30px;
    }
    
    .search-form {
        flex-wrap: wrap;
        justify-content: center;
    }
    
    .search-input {
        width: 250px;
    }
    
    .pet-stats {
        flex-wrap: wrap;
    }
    
    .stat-item {
        flex: 1 1 calc(50% - 10px);
        min-width: 200px;
    }
}

@media screen and (max-width: 768px) {
    .banner-section {
        padding: 40px 0 30px;
    }
    
    .banner-title {
        font-size: 32px;
    }
    
    .banner-subtitle {
        font-size: 16px;
    }
    
    .pet-icon {
        width: 100px;
        height: 100px;
        font-size: 50px;
    }
    
    .search-form {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-input, .search-select {
        width: 100%;
    }
    
    .pet-stats {
        flex-direction: column;
    }
    
    .stat-item {
        flex: 1 1 100%;
    }
    
    .pet-actions {
        flex-direction: column;
    }
    
    .info-content {
        flex-direction: column;
        gap: 20px;
    }
    
    .info-item {
        font-size: 14px;
    }
    
    .section-header h2 {
        font-size: 20px;
    }
    
    .my-adopts {
        text-align: center;
        margin-bottom: 20px;
    }
}

@media screen and (max-width: 768px) {
    .banner-section {
        padding: 40px 0 30px;
    }
    
    .banner-title {
        font-size: 32px;
    }
    
    .banner-subtitle {
        font-size: 16px;
    }
    
    .pet-icon {
        width: 100px;
        height: 100px;
        font-size: 50px;
    }
    
    .search-form {
        flex-direction: column;
        align-items: stretch;
    }
    
    .search-input, .search-select {
        width: 100%;
    }
    
    .pet-stats {
        flex-direction: column;
    }
    
    .stat-item {
        flex: 1 1 100%;
    }
    
    .pet-actions {
        flex-direction: column;
    }
    
    .info-content {
        flex-direction: column;
        gap: 20px;
    }
    
    .info-item {
        font-size: 14px;
    }
    
    .section-header h2 {
        font-size: 20px;
    }
    
    .my-adopts {
        text-align: center;
        margin-bottom: 20px;
    }
}

@media screen and (max-width: 480px) {
    .banner-title {
        font-size: 28px;
    }
    
    .pet-icon {
        width: 80px;
        height: 80px;
        font-size: 40px;
    }
    
    .guide-section, .tips-section {
        padding: 20px;
    }
    
    .search-section {
        padding: 20px;
    }
    
    .pet-info {
        padding: 15px;
    }
    
    .pet-header h3 {
        font-size: 18px;
    }
}
</style>