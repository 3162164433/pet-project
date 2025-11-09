<template>
  <div class="recommendation-container">
    <!-- 头部设计 -->
    <div class="recommendation-header">
      <div class="header-icon">
        <i class="el-icon-magic-stick"></i>
      </div>
      <h2>智能推荐</h2>
      <p class="recommendation-subtitle">告诉我您的需求，我将为您推荐最合适的宠物、宠物用品或宠物服务</p>
    </div>
    
    <div class="recommendation-input">
      <!-- 文本输入区域 -->
      <el-input
        v-model="userQuery"
        type="textarea"
        :rows="3"
        placeholder="例如：我想养一只安静的猫；或者：我需要一个适合小型犬的食盆；或者：我的猫需要美容服务；或者：我想寄养我的狗狗一周"
        :disabled="loading"
        class="query-input"
      />
      
      <!-- 快速建议标签 -->
      <div class="quick-suggestions" v-if="!loading && !result">
        <span class="suggestion-label">热门推荐：</span>
        <el-tag
          v-for="(suggestion, index) in quickSuggestions"
          :key="index"
          @click="selectSuggestion(suggestion)"
          effect="plain"
          class="suggestion-tag"
          :class="{ 'active': userQuery === suggestion }"
        >
          {{ suggestion }}
        </el-tag>
      </div>
      
      <!-- 推荐类型选择 -->
      <div class="recommendation-type-selector">
        <div class="type-title">选择推荐类型：</div>
        <el-radio-group v-model="selectedType" class="type-options">
          <el-radio-button label="PET" class="type-option">
            <i class="el-icon-cat"></i> 宠物
          </el-radio-button>
          <el-radio-button label="GOODS" class="type-option">
            <i class="el-icon-shopping-bag"></i> 宠物用品
          </el-radio-button>
          <el-radio-button label="TRAINING" class="type-option">
            <i class="el-icon-guide"></i> 训练服务
          </el-radio-button>
          <el-radio-button label="MEDICAL" class="type-option">
            <i class="el-icon-first-aid-kit"></i> 医疗服务
          </el-radio-button>
        </el-radio-group>
      </div>
      
      <!-- 获取推荐按钮 -->
      <el-button 
        type="primary" 
        class="get-recommendation-btn"
        @click="getRecommendation" 
        :loading="loading"
        :disabled="!userQuery.trim() || !selectedType"
      >
        <i class="el-icon-search"></i> 获取推荐
      </el-button>
    </div>
    
    <div v-if="loading" class="recommendation-loading">
      <el-skeleton :rows="6" animated />
    </div>
    
    <div v-if="result && !loading" class="recommendation-result">
      <div class="recommendation-explanation">
        <h3>推荐结果</h3>
        <p>{{ result.explanation }}</p>
      </div>
      
      <!-- 宠物推荐 -->
      <div v-if="selectedType === 'PET' && result.recommendations && result.recommendations.length > 0" class="recommendation-item">
        <h4>宠物推荐</h4>
        <div v-for="pet in result.recommendations.filter(item => item.type === 'PET')" :key="'pet-'+pet.id" class="recommendation-card">
          <div class="card-header">
            <img v-if="pet.details && pet.details.img" 
                 :src="'api/'+pet.details.img" 
                 alt="宠物图片"
                 class="pet-image" />
            <div v-else class="no-image">暂无图片</div>
            <div class="score-badge">匹配度: {{ Math.round(pet.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ pet.details ? pet.details.name : '未知宠物' }}</h5>
            <p class="pet-info" v-if="pet.details">
              {{ pet.details.breed }} · {{ pet.details.age }}岁 · {{ pet.details.sex }}
            </p>
            <p class="reason">{{ pet.reason }}</p>
            <el-button type="primary" size="small" @click="goToDetail('pet', pet.id)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 向后兼容的单个宠物推荐 (仅当没有多个宠物推荐时显示) -->
      <div v-else-if="selectedType === 'PET' && result.pet && Object.keys(result.pet).length > 0" class="recommendation-item">
        <h4>宠物推荐</h4>
        <div class="recommendation-card">
          <div class="card-header">
            <img v-if="result.pet.details && result.pet.details.img" 
                 :src="'api/'+result.pet.details.img" 
                 alt="宠物图片"
                 class="pet-image" />
            <div v-else class="no-image">暂无图片</div>
            <div class="score-badge">匹配度: {{ Math.round(result.pet.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ result.pet.details ? result.pet.details.name : '未知宠物' }}</h5>
            <p class="pet-info" v-if="result.pet.details">
              {{ result.pet.details.breed }} · {{ result.pet.details.age }}岁 · {{ result.pet.details.sex }}
            </p>
            <p class="reason">{{ result.pet.reason }}</p>
            <el-button type="primary" size="small" @click="goToDetail('pet', result.pet.id)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 宠物用品推荐 -->
      <div v-if="selectedType === 'GOODS' && result.recommendations && result.recommendations.length > 0" class="recommendation-item">
        <h4>宠物用品推荐</h4>
        <div v-for="goods in result.recommendations.filter(item => item.type === 'GOODS')" :key="'goods-'+goods.id" class="recommendation-card">
          <div class="card-header">
            <img v-if="goods.details && goods.details.img" 
                 :src="'api/'+goods.details.img" 
                 alt="商品图片"
                 class="goods-image" />
            <div v-else class="no-image">暂无图片</div>
            <div class="score-badge">匹配度: {{ Math.round(goods.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ goods.details ? goods.details.name : '未知商品' }}</h5>
            <p class="price" v-if="goods.details">
              ¥{{ goods.details.price }}
            </p>
            <p class="reason">{{ goods.reason }}</p>
            <el-button type="primary" size="small" @click="showGoodsDetail(goods)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 向后兼容的单个商品推荐 -->
      <div v-else-if="selectedType === 'GOODS' && result.goodsItem && Object.keys(result.goodsItem).length > 0" class="recommendation-item">
        <h4>宠物用品推荐</h4>
        <div class="recommendation-card">
          <div class="card-header">
            <img v-if="result.goodsItem.details && result.goodsItem.details.img" 
                 :src="result.goodsItem.details.img" 
                 alt="商品图片"
                 class="goods-image" />
            <div v-else class="no-image">暂无图片</div>
            <div class="score-badge">匹配度: {{ Math.round(result.goodsItem.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ result.goodsItem.details ? result.goodsItem.details.name : '未知商品' }}</h5>
            <p class="price" v-if="result.goodsItem.details">
              ¥{{ result.goodsItem.details.price }}
            </p>
            <p class="reason">{{ result.goodsItem.reason }}</p>
            <el-button type="primary" size="small" @click="showGoodsDetail(result.goodsItem)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 宠物训练服务推荐 -->
      <div v-if="selectedType === 'TRAINING' && result.recommendations && result.recommendations.length > 0" class="recommendation-item">
        <h4>宠物训练服务推荐</h4>
        <div v-for="service in result.recommendations.filter(item => item.type === 'TRAINING')" :key="'training-'+service.id" class="recommendation-card">
          <div class="card-header service-header">
            <div class="service-icon">
              <i class="el-icon-guide"></i>
            </div>
            <div class="score-badge">匹配度: {{ Math.round(service.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ service.details ? service.details.name : '训练服务' }}</h5>
            <p class="service-info" v-if="service.serviceType">
              服务类型: {{ service.serviceType }}
            </p>
            <p class="reason">{{ service.reason }}</p>
            <el-button type="primary" size="small" @click="showTrainingDetail(service)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 向后兼容的单个训练服务推荐 -->
      <div v-else-if="selectedType === 'TRAINING' && result.trainingService && Object.keys(result.trainingService).length > 0" class="recommendation-item">
        <h4>宠物训练服务推荐</h4>
        <div class="recommendation-card">
          <div class="card-header service-header">
            <div class="service-icon">
              <i class="el-icon-guide"></i>
            </div>
            <div class="score-badge">匹配度: {{ Math.round(result.trainingService.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ result.trainingService.details ? result.trainingService.details.name : '训练服务' }}</h5>
            <p class="service-info" v-if="result.trainingService.serviceType">
              服务类型: {{ result.trainingService.serviceType }}
            </p>
            <p class="reason">{{ result.trainingService.reason }}</p>
            <el-button type="primary" size="small" @click="showTrainingDetail(result.trainingService)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 宠物医疗服务推荐 -->
      <div v-if="selectedType === 'MEDICAL' && result.recommendations && result.recommendations.length > 0" class="recommendation-item">
        <h4>宠物医疗服务推荐</h4>
        <div v-for="service in result.recommendations.filter(item => item.type === 'MEDICAL')" :key="'medical-'+service.id" class="recommendation-card">
          <div class="card-header service-header">
            <div class="service-icon">
              <i class="el-icon-first-aid-kit"></i>
            </div>
            <div class="score-badge">匹配度: {{ Math.round(service.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ service.details ? service.details.name : '医疗服务' }}</h5>
            <p class="service-info" v-if="service.serviceType">
              服务类型: {{ service.serviceType }}
            </p>
            <p class="reason">{{ service.reason }}</p>
            <el-button type="primary" size="small" @click="showMedicalDetail(service)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 向后兼容的单个医疗服务推荐 -->
      <div v-else-if="selectedType === 'MEDICAL' && result.medicalService && Object.keys(result.medicalService).length > 0" class="recommendation-item">
        <h4>宠物医疗服务推荐</h4>
        <div class="recommendation-card">
          <div class="card-header service-header">
            <div class="service-icon">
              <i class="el-icon-first-aid-kit"></i>
            </div>
            <div class="score-badge">匹配度: {{ Math.round(result.medicalService.score) }}%</div>
          </div>
          <div class="card-content">
            <h5>{{ result.medicalService.details ? result.medicalService.details.name : '医疗服务' }}</h5>
            <p class="service-info" v-if="result.medicalService.serviceType">
              服务类型: {{ result.medicalService.serviceType }}
            </p>
            <p class="reason">{{ result.medicalService.reason }}</p>
            <el-button type="primary" size="small" @click="showMedicalDetail(result.medicalService)" class="detail-btn">
              查看详情
            </el-button>
          </div>
        </div>
      </div>
      
      <!-- 无匹配结果 -->
      <div v-if="result && !loading && 
                (!result.recommendations || result.recommendations.length === 0) && 
                (!result.pet || Object.keys(result.pet).length === 0) && 
                (!result.goodsItem || Object.keys(result.goodsItem).length === 0) && 
                (!result.trainingService || Object.keys(result.trainingService).length === 0) && 
                (!result.medicalService || Object.keys(result.medicalService).length === 0)" 
           class="no-recommendations">
        <el-empty description="暂无匹配的推荐结果，请尝试其他需求描述"></el-empty>
      </div>
    </div>
    
    <!-- 商品详情对话框 -->
          <el-dialog
        title="商品详情"
        :visible.sync="goodsDialogVisible"
        width="50%"
        center>
      <div v-if="currentDetail" class="detail-dialog-content">
        <div class="detail-image-container">
          <img v-if="currentDetail.details && currentDetail.details.img" 
               :src="'api/'+currentDetail.details.img" 
               alt="商品图片" 
               class="detail-image" />
          <div v-else class="no-detail-image">暂无图片</div>
        </div>
        <div class="detail-info">
          <h3>{{ currentDetail.details ? currentDetail.details.name : '未知商品' }}</h3>
          <div class="detail-price" v-if="currentDetail.details">
            <span class="price-label">价格:</span>
            <span class="price-value">¥{{ currentDetail.details.price }}</span>
          </div>
          <div class="detail-stock" v-if="currentDetail.details">
            <span class="stock-label">库存:</span>
            <span class="stock-value">{{ currentDetail.details.num }}件</span>
          </div>
          <div class="detail-description" v-if="currentDetail.details">
            <h4>商品描述</h4>
            <p>{{ currentDetail.details.desrc || '暂无描述' }}</p>
          </div>
          <div class="recommendation-reason">
            <h4>推荐理由</h4>
            <p>{{ currentDetail.reason }}</p>
          </div>
          <div class="recommendation-score">
            <span class="score-label">匹配度:</span>
            <el-progress 
              :percentage="Math.round(currentDetail.score)" 
              :color="customColorMethod"
              :format="format">
            </el-progress>
          </div>
        </div>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="goodsDialogVisible = false">关闭</el-button>
          <!-- <el-button type="primary" @click="addToCart">加入购物车</el-button> -->
        </div>
      </template>
    </el-dialog>
    
    <!-- 训练服务详情对话框 -->
          <el-dialog
        title="训练服务详情"
        :visible.sync="trainingDialogVisible"
        width="50%"
        center>
      <div v-if="currentDetail" class="detail-dialog-content service-detail">
        <div class="service-icon-large">
          <i class="el-icon-guide"></i>
        </div>
        <div class="detail-info">
          <h3>{{ currentDetail.details ? currentDetail.details.name : '训练服务' }}</h3>
          <div class="detail-service-type" v-if="currentDetail.serviceType">
            <span class="service-type-label">服务类型:</span>
            <span class="service-type-value">{{ currentDetail.serviceType }}</span>
          </div>
          <div class="detail-description" v-if="currentDetail.details">
            <h4>服务描述</h4>
            <p>{{ currentDetail.details.description || '暂无描述' }}</p>
          </div>
          <div class="recommendation-reason">
            <h4>推荐理由</h4>
            <p>{{ currentDetail.reason }}</p>
          </div>
          <div class="recommendation-score">
            <span class="score-label">匹配度:</span>
            <el-progress 
              :percentage="Math.round(currentDetail.score)" 
              :color="customColorMethod"
              :format="format">
            </el-progress>
          </div>
        </div>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="trainingDialogVisible = false">关闭</el-button>
 
        </div>
      </template>
    </el-dialog>
    
    <!-- 医疗服务详情对话框 -->
          <el-dialog
        title="医疗服务详情"
        :visible.sync="medicalDialogVisible"
        width="50%"
        center>
      <div v-if="currentDetail" class="detail-dialog-content service-detail">
        <div class="service-icon-large">
          <i class="el-icon-first-aid-kit"></i>
        </div>
        <div class="detail-info">
          <h3>{{ currentDetail.details ? currentDetail.details.name : '医疗服务' }}</h3>
          <div class="detail-service-type" v-if="currentDetail.serviceType">
            <span class="service-type-label">服务类型:</span>
            <span class="service-type-value">{{ currentDetail.serviceType }}</span>
          </div>
          <div class="detail-description" v-if="currentDetail.details">
            <h4>服务描述</h4>
            <p>{{ currentDetail.details.description || '暂无描述' }}</p>
          </div>
          <div class="recommendation-reason">
            <h4>推荐理由</h4>
            <p>{{ currentDetail.reason }}</p>
          </div>
          <div class="recommendation-score">
            <span class="score-label">匹配度:</span>
            <el-progress 
              :percentage="Math.round(currentDetail.score)" 
              :color="customColorMethod"
              :format="format">
            </el-progress>
          </div>
        </div>
      </div>
      <template #footer>
        <div class="dialog-footer">
          <el-button @click="medicalDialogVisible = false">关闭</el-button>
     
        </div>
      </template>
    </el-dialog>
    
    <!-- 错误提示 -->
    <div v-if="error" class="recommendation-error">
      <el-alert
        title="获取推荐失败"
        type="error"
        :description="error"
        show-icon
        :closable="false"
      />
    </div>
  </div>
</template>

<script>
import Request from '../../utils/request.js'

export default {
  name: 'PetRecommendation',
  data() {
    return {
      userQuery: '',
      loading: false,
      result: null,
      error: null,
      selectedType: 'PET', // 默认选择宠物推荐
      goodsDialogVisible: false,
      trainingDialogVisible: false,
      medicalDialogVisible: false,
      currentDetail: null,
      // 添加智能提示功能
      quickSuggestions: [
        '我想要一只活泼的小狗',
        '我想领养一只安静的猫咪', 
        '我想要一只会说话的鹦鹉',
        '我想要一只适合公寓养的宠物',
        '我想要一只适合陪伴老人的宠物'
      ]
    }
  },
  methods: {
    getRecommendation() {
      if (!this.userQuery.trim()) {
        this.$message.warning('请输入您的需求描述');
        return;
      }
      
      if (!this.selectedType) {
        this.$message.warning('请选择一种推荐类型');
        return;
      }
      
      this.loading = true;
      this.error = null;
      this.result = null;
      
      // 获取当前登录用户ID
      const userId = localStorage.getItem('userId');
      
      const params = {
        query: this.userQuery,
        userId: userId || null,
        type: this.selectedType
      };
      
      Request.post('/api/recommendation/query', null, { params })
        .then(res => {
          this.loading = false;
          if (res.code === 0 || res.code === '0') {
            this.result = res.data;
          } else {
            this.error = res.msg || '推荐失败，请稍后再试';
            this.$message.error(this.error);
          }
        })
        .catch(err => {
          this.loading = false;
          this.error = '推荐服务暂时不可用，请稍后再试';
          console.error('推荐请求失败:', err);
          this.$message.error(this.error);
        });
    },
    
    goToDetail(type, id) {
      if (!id) return;
      
      if (type === 'pet') {
        // 跳转到宠物详情页
        this.$router.push({ name: 'petDetail', params: { id } });
      }
    },
    
    // 显示商品详情对话框
    showGoodsDetail(goods) {
      this.currentDetail = goods;
      this.goodsDialogVisible = true;
    },
    
    // 显示训练服务详情对话框
    showTrainingDetail(service) {
      this.currentDetail = service;
      this.trainingDialogVisible = true;
    },
    
    // 显示医疗服务详情对话框
    showMedicalDetail(service) {
      this.currentDetail = service;
      this.medicalDialogVisible = true;
    },
    
    // 将商品添加到购物车
    addToCart() {
      if (!this.currentDetail || !this.currentDetail.details) {
        this.$message.warning('商品信息不完整');
        return;
      }
      
      const userId = localStorage.getItem('userId');
      if (!userId) {
        this.$message.warning('请先登录');
        return;
      }
      
      // 添加到购物车的逻辑
      this.$message.success(`已将 ${this.currentDetail.details.name} 添加到购物车`);
      this.goodsDialogVisible = false;
    },
    
    // 预约服务
    bookService(type) {
      if (!this.currentDetail || !this.currentDetail.details) {
        this.$message.warning('服务信息不完整');
        return;
      }
      
      const userId = localStorage.getItem('userId');
      if (!userId) {
        this.$message.warning('请先登录');
        return;
      }
      
      // 预约服务的逻辑
      this.$message.success(`已预约 ${this.currentDetail.details.name} 服务`);
      if (type === 'training') {
        this.trainingDialogVisible = false;
      } else if (type === 'medical') {
        this.medicalDialogVisible = false;
      }
    },
    
    // 进度条颜色方法
    customColorMethod(percentage) {
      if (percentage < 60) {
        return '#909399'; // 低匹配度
      } else if (percentage < 80) {
        return '#e6a23c'; // 中匹配度
      } else {
        return '#e91e63'; // 高匹配度，使用粉色主题色
      }
    },
    
    // 进度条文字格式
    format(percentage) {
      return `${percentage}%`;
    },
    
    // 选择快速建议
    selectSuggestion(suggestion) {
      this.userQuery = suggestion;
    }
  }
}
</script>

<style scoped>
/* 全局容器样式 */
.recommendation-container {
  padding: 30px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 16px;
  box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
  border: 1px solid rgba(248, 187, 208, 0.3);
  transition: all 0.3s ease;
}

/* 头部样式 */
.recommendation-header {
  text-align: center;
  margin-bottom: 30px;
  position: relative;
  padding-bottom: 20px;
}

.recommendation-header::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  width: 80px;
  height: 4px;
  background: linear-gradient(90deg, #e91e63, #ff80ab);
  border-radius: 2px;
}

.header-icon {
  display: inline-flex;
  align-items: center;
  justify-content: center;
  width: 60px;
  height: 60px;
  background: linear-gradient(135deg, #e91e63, #ff80ab);
  border-radius: 50%;
  margin-bottom: 15px;
  box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
  animation: pulse 3s infinite;
}

.header-icon i {
  font-size: 32px;
  color: white;
}

@keyframes pulse {
  0% {
    box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
  }
  50% {
    box-shadow: 0 4px 25px rgba(233, 30, 99, 0.5);
    transform: scale(1.05);
  }
  100% {
    box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
  }
}

.recommendation-header h2 {
  font-size: 28px;
  font-weight: 700;
  color: #e91e63;
  margin: 0 0 10px 0;
  position: relative;
}

.recommendation-subtitle {
  color: #666;
  margin-top: 0;
  font-size: 16px;
  line-height: 1.5;
}

/* 输入区域样式 */
.recommendation-input {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
}

.query-input {
  margin-bottom: 20px !important;
  transition: all 0.3s ease;
}

.query-input:focus-within {
  transform: translateY(-2px);
}

.query-input .el-textarea__inner {
  border-radius: 12px;
  border: 2px solid #f8bbd0;
  transition: all 0.3s ease;
  padding: 15px;
  font-size: 15px;
}

.query-input .el-textarea__inner:focus {
  border-color: #e91e63;
  box-shadow: 0 0 0 3px rgba(233, 30, 99, 0.1);
}

/* 快速建议样式 */
.quick-suggestions {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fef9fb;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.5);
}

.suggestion-label {
  font-weight: 500;
  color: #e91e63;
  margin-right: 10px;
  font-size: 14px;
}

.suggestion-tag {
  margin: 5px;
  transition: all 0.3s ease;
  cursor: pointer;
  background-color: #fce4ec;
  border-color: #f8bbd0;
}

.suggestion-tag:hover {
  background-color: #f8bbd0 !important;
  border-color: #e91e63 !important;
  transform: translateY(-2px);
  box-shadow: 0 2px 8px rgba(233, 30, 99, 0.2);
}

.suggestion-tag.active {
  background-color: #e91e63 !important;
  border-color: #e91e63 !important;
  color: white;
}

/* 推荐类型选择样式 */
.recommendation-type-selector {
  margin: 20px 0;
  padding: 20px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.8);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
  transition: all 0.3s ease;
}

.recommendation-type-selector:hover {
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
}

.type-title {
  font-weight: 600;
  margin-bottom: 15px;
  color: #333;
  font-size: 16px;
}

.type-options {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
  gap: 10px;
}

.type-option {
  transition: all 0.3s ease;
  min-width: 120px;
}

.type-option .el-radio-button__inner {
  border-radius: 8px;
  padding: 12px 16px;
  font-size: 14px;
  transition: all 0.3s ease;
}

.type-option .el-radio-button__inner:hover {
  color: #e91e63;
  border-color: #f8bbd0;
}

.type-option.is-active .el-radio-button__inner {
  background-color: #e91e63;
  border-color: #e91e63;
  color: white;
}

/* 按钮样式 */
.get-recommendation-btn {
  margin-top: 20px;
  width: 100%;
  max-width: 240px;
  align-self: center;
  padding: 14px;
  font-size: 16px;
  font-weight: 500;
  border-radius: 50px;
  background: linear-gradient(135deg, #e91e63, #ff80ab);
  border: none;
  transition: all 0.3s ease;
  box-shadow: 0 4px 15px rgba(233, 30, 99, 0.3);
}

.get-recommendation-btn:hover {
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(233, 30, 99, 0.4);
  background: linear-gradient(135deg, #c2185b, #e91e63);
}

.get-recommendation-btn:active {
  transform: translateY(-1px);
  box-shadow: 0 3px 10px rgba(233, 30, 99, 0.3);
}

.get-recommendation-btn i {
  margin-right: 8px;
}

.recommendation-loading {
  padding: 40px;
  text-align: center;
}

.recommendation-result {
  margin-top: 30px;
  animation: fadeIn 0.5s ease;
}

@keyframes fadeIn {
  from { opacity: 0; transform: translateY(20px); }
  to { opacity: 1; transform: translateY(0); }
}

/* 推荐说明样式 */
.recommendation-explanation {
  margin-bottom: 30px;
  padding: 20px;
  background: linear-gradient(135deg, #fff5f7, #fef9fb);
  border-radius: 16px;
  border: 1px solid rgba(248, 187, 208, 0.6);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.04);
  transition: all 0.3s ease;
}

.recommendation-explanation:hover {
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.06);
  transform: translateY(-2px);
}

.recommendation-explanation h3 {
  color: #e91e63;
  font-size: 20px;
  margin-top: 0;
  margin-bottom: 12px;
  font-weight: 600;
}

.recommendation-explanation p {
  font-size: 15px;
  line-height: 1.6;
  color: #555;
  margin: 0;
}

/* 推荐项样式 */
.recommendation-item {
  margin-bottom: 35px;
}

.recommendation-item h4 {
  font-size: 22px;
  font-weight: 700;
  color: #e91e63;
  margin-bottom: 20px;
  position: relative;
  display: inline-block;
}

.recommendation-item h4::after {
  content: '';
  position: absolute;
  bottom: -8px;
  left: 0;
  width: 100%;
  height: 3px;
  background: linear-gradient(90deg, #e91e63, #ff80ab);
  border-radius: 2px;
}

/* 推荐卡片样式 */
.recommendation-card {
  display: flex;
  border: 1px solid rgba(248, 187, 208, 0.8);
  border-radius: 16px;
  overflow: hidden;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05);
  margin-bottom: 20px;
  transition: all 0.3s ease;
  background: #fff;
  position: relative;
}

.recommendation-card::before {
  content: '';
  position: absolute;
  top: 0;
  left: 0;
  width: 5px;
  height: 100%;
  background: linear-gradient(to bottom, #e91e63, #ff80ab);
}

.recommendation-card:hover {
  transform: translateY(-8px);
  box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
  border-color: #e91e63;
}

/* 卡片头部样式 */
.card-header {
  position: relative;
  width: 200px;
  min-height: 200px;
  background-color: #f9f9f9;
  overflow: hidden;
  display: flex;
  align-items: center;
  justify-content: center;
}

.pet-image, .goods-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s cubic-bezier(0.25, 0.46, 0.45, 0.94);
}

.card-header:hover .pet-image,
.card-header:hover .goods-image {
  transform: scale(1.15);
}

/* 服务图标样式 */
.service-header {
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #fff5f7, #fef9fb);
}

.service-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 64px;
  color: #e91e63;
  transition: transform 0.3s ease;
  background: white;
  width: 120px;
  height: 120px;
  border-radius: 50%;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
}

.service-header:hover .service-icon {
  transform: scale(1.2) rotate(5deg);
}

/* 无图片样式 */
.no-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 16px;
  background: linear-gradient(135deg, #f5f7fa, #e9ecef);
  border-radius: 4px;
  padding: 20px;
  text-align: center;
}

/* 匹配度标签样式 */
.score-badge {
  position: absolute;
  top: 15px;
  right: 15px;
  background: linear-gradient(135deg, #e91e63, #ff80ab);
  color: white;
  padding: 8px 16px;
  border-radius: 50px;
  font-size: 14px;
  font-weight: bold;
  box-shadow: 0 3px 10px rgba(233, 30, 99, 0.3);
  z-index: 10;
  transition: all 0.3s ease;
}

.recommendation-card:hover .score-badge {
  transform: scale(1.1);
  box-shadow: 0 4px 15px rgba(233, 30, 99, 0.4);
}

/* 卡片内容样式 */
.card-content {
  flex: 1;
  padding: 20px;
  display: flex;
  flex-direction: column;
  justify-content: space-between;
}

.card-content h5 {
  margin: 0 0 12px 0;
  font-size: 20px;
  font-weight: 600;
  color: #333;
  transition: color 0.3s ease;
}

.recommendation-card:hover h5 {
  color: #e91e63;
}

.pet-info, .price, .service-info {
  font-size: 15px;
  color: #606266;
  margin-bottom: 12px;
  display: flex;
  align-items: center;
}

.pet-info::before, .service-info::before {
  content: '•';
  color: #e91e63;
  margin-right: 5px;
  font-weight: bold;
}

.price {
  font-size: 18px;
  font-weight: 600;
  color: #e91e63;
  margin-bottom: 12px;
}

.price::before {
  content: '';
}

.reason {
  font-size: 15px;
  color: #303133;
  margin-bottom: 20px;
  line-height: 1.6;
  flex: 1;
}

/* 详情按钮样式 */
.detail-btn {
  margin-top: 15px;
  background-color: #e91e63;
  border-color: #e91e63;
  transition: all 0.3s ease;
  border-radius: 50px;
  padding: 8px 20px;
  font-size: 14px;
  font-weight: 500;
  align-self: flex-start;
  box-shadow: 0 3px 10px rgba(233, 30, 99, 0.2);
}

.detail-btn:hover, .detail-btn:focus {
  background-color: #c2185b;
  border-color: #c2185b;
  transform: translateY(-3px);
  box-shadow: 0 6px 20px rgba(233, 30, 99, 0.3);
}

.detail-btn:active {
  transform: translateY(-1px);
}

/* 无推荐结果样式 */
.no-recommendations {
  padding: 60px 20px;
  text-align: center;
}

.no-recommendations .el-empty__description {
  color: #909399;
  font-size: 16px;
  margin-top: 20px;
}

/* 错误提示样式 */
.recommendation-error {
  margin-top: 30px;
  animation: shake 0.5s ease;
}

@keyframes shake {
  0%, 100% { transform: translateX(0); }
  25% { transform: translateX(-5px); }
  75% { transform: translateX(5px); }
}

.no-recommendations {
  padding: 30px 0;
}

.recommendation-error {
  margin-top: 20px;
}

/* 对话框样式优化 */
.detail-dialog-content {
  display: flex;
  gap: 30px;
  padding: 10px;
}

/* 商品详情图片容器 */
.detail-image-container {
  width: 250px;
  height: 250px;
  overflow: hidden;
  border-radius: 12px;
  background-color: #f9f9f9;
  box-shadow: 0 4px 15px rgba(0, 0, 0, 0.08);
  transition: all 0.3s ease;
}

.detail-image-container:hover {
  transform: scale(1.03);
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.12);
}

.detail-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.5s ease;
}

.detail-image-container:hover .detail-image {
  transform: scale(1.1);
}

/* 无图片状态 */
.no-detail-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 16px;
  background: linear-gradient(135deg, #f5f7fa, #e9ecef);
  border-radius: 12px;
  padding: 20px;
  text-align: center;
}

/* 服务详情样式 */
.service-detail {
  align-items: center;
  justify-content: center;
  text-align: center;
}

.service-icon-large {
  font-size: 80px;
  color: #e91e63;
  margin-bottom: 20px;
  background: white;
  width: 150px;
  height: 150px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  box-shadow: 0 4px 20px rgba(233, 30, 99, 0.2);
  animation: bounce 2s infinite;
}

@keyframes bounce {
  0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
  40% { transform: translateY(-15px); }
  60% { transform: translateY(-8px); }
}

/* 详情信息样式 */
.detail-info {
  flex: 1;
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.detail-info h3 {
  color: #333;
  font-size: 24px;
  margin: 0;
  font-weight: 700;
  position: relative;
  padding-bottom: 10px;
}

.detail-info h3::after {
  content: '';
  position: absolute;
  bottom: 0;
  left: 0;
  width: 60px;
  height: 3px;
  background: linear-gradient(90deg, #e91e63, #ff80ab);
  border-radius: 2px;
}

/* 价格和库存信息 */
.detail-price, .detail-stock, .detail-service-type {
  display: flex;
  align-items: center;
  gap: 10px;
  font-size: 16px;
}

.price-label, .stock-label, .service-type-label {
  font-weight: 500;
  color: #666;
}

.price-value {
  font-size: 22px;
  font-weight: 700;
  color: #e91e63;
}

.stock-value, .service-type-value {
  color: #333;
  font-weight: 500;
}

/* 描述和推荐理由 */
.detail-description, .recommendation-reason {
  margin-top: 10px;
}

.detail-description h4, .recommendation-reason h4 {
  color: #e91e63;
  font-size: 18px;
  margin: 0 0 10px 0;
  font-weight: 600;
}

.detail-description p, .recommendation-reason p {
  color: #555;
  font-size: 15px;
  line-height: 1.6;
  margin: 0;
}

/* 匹配度进度条 */
.recommendation-score {
  margin-top: 15px;
}

.score-label {
  display: block;
  font-weight: 500;
  color: #666;
  margin-bottom: 8px;
  font-size: 16px;
}

/* 对话框底部 */
.dialog-footer {
  text-align: center;
  padding-top: 20px;
}

.dialog-footer .el-button {
  margin: 0 10px;
  padding: 8px 24px;
  border-radius: 50px;
  font-size: 15px;
  transition: all 0.3s ease;
}

.dialog-footer .el-button:hover {
  transform: translateY(-2px);
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.detail-info {
  flex: 1;
}

.detail-info h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}

.detail-price, .detail-stock, .detail-service-type {
  margin-bottom: 10px;
  font-size: 14px;
}

.price-label, .stock-label, .service-type-label, .score-label {
  font-weight: bold;
  color: #606266;
  margin-right: 5px;
}

.price-value {
  color: #f56c6c;
  font-size: 16px;
  font-weight: bold;
}

.detail-description, .recommendation-reason {
  margin: 15px 0;
}

.detail-description h4, .recommendation-reason h4 {
  font-size: 16px;
  margin-bottom: 8px;
  color: #303133;
}

.detail-description p, .recommendation-reason p {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.recommendation-score {
  margin-top: 20px;
}

.service-detail {
  text-align: center;
}

.service-icon-large {
  font-size: 60px;
  color: #409EFF;
  margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
  .recommendation-input {
    flex-direction: column;
  }
  
  .recommendation-input .el-input {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .recommendation-card {
    flex-direction: column;
  }
  
  .card-header {
    width: 100%;
    height: 180px;
  }

  .detail-dialog-content {
    flex-direction: column;
  }
  
  .detail-image-container {
    width: 100%;
    height: auto;
    aspect-ratio: 1/1;
  }
}
</style>




<style scoped>
.recommendation-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  border: 1px solid rgba(248, 187, 208, 0.5);
}

.recommendation-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: #e91e63;
  margin: 0;
  position: relative;
}

.recommendation-subtitle {
  color: #666;
  margin-top: 10px;
}

.recommendation-input {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
}

.recommendation-input .el-input {
  margin-bottom: 15px;
}

.recommendation-type-selector {
  margin: 15px 0;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.8);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.type-title {
  font-weight: 500;
  margin-bottom: 10px;
  color: #333;
}

.el-radio-group {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}

.el-button {
  margin-top: 15px;
  width: 100%;
  max-width: 200px;
  align-self: center;
}

.recommendation-loading {
  padding: 20px;
}

.recommendation-result {
  margin-top: 20px;
}

.recommendation-explanation {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.5);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.recommendation-explanation h3 {
  color: #e91e63;
  font-size: 18px;
  margin-top: 0;
  margin-bottom: 10px;
}

.recommendation-item {
  margin-bottom: 25px;
}

.recommendation-item h4 {
  font-size: 20px;
  font-weight: 600;
  color: #e91e63;
  margin-bottom: 15px;
  position: relative;
}

.recommendation-card {
  display: flex;
  border: 1px solid rgba(248, 187, 208, 0.8);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  margin-bottom: 15px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.recommendation-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-header {
  position: relative;
  width: 180px;
  min-height: 180px;
  background-color: #f5f7fa;
  overflow: hidden;
}

.pet-image, .goods-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card-header:hover .pet-image,
.card-header:hover .goods-image {
  transform: scale(1.05);
}

.service-header {
  display: flex;
  align-items: center;
  justify-content: center;
}

.service-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  color: #e91e63;
  transition: transform 0.3s ease;
}

.service-header:hover .service-icon {
  transform: scale(1.1);
}

.no-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.score-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(233, 30, 99, 0.8);
  color: white;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: bold;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-content {
  flex: 1;
  padding: 15px;
}

h5 {
  margin: 0 0 8px 0;
  font-size: 16px;
}

.pet-info, .price, .service-info {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

.reason {
  font-size: 14px;
  color: #303133;
  margin-bottom: 15px;
  line-height: 1.4;
}

.detail-btn {
  margin-top: 10px;
  background-color: #e91e63;
  border-color: #e91e63;
  transition: all 0.3s ease;
}

.detail-btn:hover, .detail-btn:focus {
  background-color: #c2185b;
  border-color: #c2185b;
  transform: translateY(-2px);
}

.no-recommendations {
  padding: 30px 0;
}

.recommendation-error {
  margin-top: 20px;
}

.detail-dialog-content {
  display: flex;
  gap: 20px;
}

.detail-image-container {
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 4px;
  background-color: #f5f7fa;
}

.detail-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.no-detail-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.detail-info {
  flex: 1;
}

.detail-info h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}

.detail-price, .detail-stock, .detail-service-type {
  margin-bottom: 10px;
  font-size: 14px;
}

.price-label, .stock-label, .service-type-label, .score-label {
  font-weight: bold;
  color: #606266;
  margin-right: 5px;
}

.price-value {
  color: #f56c6c;
  font-size: 16px;
  font-weight: bold;
}

.detail-description, .recommendation-reason {
  margin: 15px 0;
}

.detail-description h4, .recommendation-reason h4 {
  font-size: 16px;
  margin-bottom: 8px;
  color: #303133;
}

.detail-description p, .recommendation-reason p {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.recommendation-score {
  margin-top: 20px;
}

.service-detail {
  text-align: center;
}

.service-icon-large {
  font-size: 60px;
  color: #409EFF;
  margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
  .recommendation-input {
    flex-direction: column;
  }
  
  .recommendation-input .el-input {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .recommendation-card {
    flex-direction: column;
  }
  
  .card-header {
    width: 100%;
    height: 180px;
  }

  .detail-dialog-content {
    flex-direction: column;
  }
  
  .detail-image-container {
    width: 100%;
    height: auto;
    aspect-ratio: 1/1;
  }
}
</style>

quickSuggestions: [
  '我想要一只活泼的小狗',
  '我想领养一只安静的猫咪', 
  '我想要一只会说话的鹦鹉',
  '我想要一只适合公寓养的宠物',
  '我想要一只适合陪伴老人的宠物'
]
}


<style scoped>
.recommendation-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  border: 1px solid rgba(248, 187, 208, 0.5);
}

.recommendation-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: #e91e63;
  margin: 0;
  position: relative;
}

.recommendation-subtitle {
  color: #666;
  margin-top: 10px;
}

.recommendation-input {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
}

.recommendation-input .el-input {
  margin-bottom: 15px;
}

.recommendation-type-selector {
  margin: 15px 0;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.8);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.type-title {
  font-weight: 500;
  margin-bottom: 10px;
  color: #333;
}

.el-radio-group {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}

.el-button {
  margin-top: 15px;
  width: 100%;
  max-width: 200px;
  align-self: center;
}

.recommendation-loading {
  padding: 20px;
}

.recommendation-result {
  margin-top: 20px;
}

.recommendation-explanation {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.5);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.recommendation-explanation h3 {
  color: #e91e63;
  font-size: 18px;
  margin-top: 0;
  margin-bottom: 10px;
}

.recommendation-item {
  margin-bottom: 25px;
}

.recommendation-item h4 {
  font-size: 20px;
  font-weight: 600;
  color: #e91e63;
  margin-bottom: 15px;
  position: relative;
}

.recommendation-card {
  display: flex;
  border: 1px solid rgba(248, 187, 208, 0.8);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  margin-bottom: 15px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.recommendation-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-header {
  position: relative;
  width: 180px;
  min-height: 180px;
  background-color: #f5f7fa;
  overflow: hidden;
}

.pet-image, .goods-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card-header:hover .pet-image,
.card-header:hover .goods-image {
  transform: scale(1.05);
}

.service-header {
  display: flex;
  align-items: center;
  justify-content: center;
}

.service-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  color: #e91e63;
  transition: transform 0.3s ease;
}

.service-header:hover .service-icon {
  transform: scale(1.1);
}

.no-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.score-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(233, 30, 99, 0.8);
  color: white;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: bold;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-content {
  flex: 1;
  padding: 15px;
}

h5 {
  margin: 0 0 8px 0;
  font-size: 16px;
}

.pet-info, .price, .service-info {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

.reason {
  font-size: 14px;
  color: #303133;
  margin-bottom: 15px;
  line-height: 1.4;
}

.detail-btn {
  margin-top: 10px;
  background-color: #e91e63;
  border-color: #e91e63;
  transition: all 0.3s ease;
}

.detail-btn:hover, .detail-btn:focus {
  background-color: #c2185b;
  border-color: #c2185b;
  transform: translateY(-2px);
}

.no-recommendations {
  padding: 30px 0;
}

.recommendation-error {
  margin-top: 20px;
}

.detail-dialog-content {
  display: flex;
  gap: 20px;
}

.detail-image-container {
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 4px;
  background-color: #f5f7fa;
}

.detail-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.no-detail-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.detail-info {
  flex: 1;
}

.detail-info h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}

.detail-price, .detail-stock, .detail-service-type {
  margin-bottom: 10px;
  font-size: 14px;
}

.price-label, .stock-label, .service-type-label, .score-label {
  font-weight: bold;
  color: #606266;
  margin-right: 5px;
}

.price-value {
  color: #f56c6c;
  font-size: 16px;
  font-weight: bold;
}

.detail-description, .recommendation-reason {
  margin: 15px 0;
}

.detail-description h4, .recommendation-reason h4 {
  font-size: 16px;
  margin-bottom: 8px;
  color: #303133;
}

.detail-description p, .recommendation-reason p {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.recommendation-score {
  margin-top: 20px;
}

.service-detail {
  text-align: center;
}

.service-icon-large {
  font-size: 60px;
  color: #409EFF;
  margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
  .recommendation-input {
    flex-direction: column;
  }
  
  .recommendation-input .el-input {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .recommendation-card {
    flex-direction: column;
  }
  
  .card-header {
    width: 100%;
    height: 180px;
  }

  .detail-dialog-content {
    flex-direction: column;
  }
  
  .detail-image-container {
    width: 100%;
    height: auto;
    aspect-ratio: 1/1;
  }
}
</style>

quickSuggestions: [
  '我想要一只活泼的小狗',
  '我想领养一只安静的猫咪', 
  '我想要一只会说话的鹦鹉',
  '我想要一只适合公寓养的宠物',
  '我想要一只适合陪伴老人的宠物'
]
}

<style scoped>
.recommendation-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  border: 1px solid rgba(248, 187, 208, 0.5);
}

.recommendation-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: #e91e63;
  margin: 0;
  position: relative;
}

.recommendation-subtitle {
  color: #666;
  margin-top: 10px;
}

.recommendation-input {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
}

.recommendation-input .el-input {
  margin-bottom: 15px;
}

.recommendation-type-selector {
  margin: 15px 0;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.8);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.type-title {
  font-weight: 500;
  margin-bottom: 10px;
  color: #333;
}

.el-radio-group {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}

.el-button {
  margin-top: 15px;
  width: 100%;
  max-width: 200px;
  align-self: center;
}

.recommendation-loading {
  padding: 20px;
}

.recommendation-result {
  margin-top: 20px;
}

.recommendation-explanation {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.5);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.recommendation-explanation h3 {
  color: #e91e63;
  font-size: 18px;
  margin-top: 0;
  margin-bottom: 10px;
}

.recommendation-item {
  margin-bottom: 25px;
}

.recommendation-item h4 {
  font-size: 20px;
  font-weight: 600;
  color: #e91e63;
  margin-bottom: 15px;
  position: relative;
}

.recommendation-card {
  display: flex;
  border: 1px solid rgba(248, 187, 208, 0.8);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  margin-bottom: 15px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.recommendation-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-header {
  position: relative;
  width: 180px;
  min-height: 180px;
  background-color: #f5f7fa;
  overflow: hidden;
}

.pet-image, .goods-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card-header:hover .pet-image,
.card-header:hover .goods-image {
  transform: scale(1.05);
}

.service-header {
  display: flex;
  align-items: center;
  justify-content: center;
}

.service-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  color: #e91e63;
  transition: transform 0.3s ease;
}

.service-header:hover .service-icon {
  transform: scale(1.1);
}

.no-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.score-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(233, 30, 99, 0.8);
  color: white;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: bold;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-content {
  flex: 1;
  padding: 15px;
}

h5 {
  margin: 0 0 8px 0;
  font-size: 16px;
}

.pet-info, .price, .service-info {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

.reason {
  font-size: 14px;
  color: #303133;
  margin-bottom: 15px;
  line-height: 1.4;
}

.detail-btn {
  margin-top: 10px;
  background-color: #e91e63;
  border-color: #e91e63;
  transition: all 0.3s ease;
}

.detail-btn:hover, .detail-btn:focus {
  background-color: #c2185b;
  border-color: #c2185b;
  transform: translateY(-2px);
}

.no-recommendations {
  padding: 30px 0;
}

.recommendation-error {
  margin-top: 20px;
}

.detail-dialog-content {
  display: flex;
  gap: 20px;
}

.detail-image-container {
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 4px;
  background-color: #f5f7fa;
}

.detail-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.no-detail-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.detail-info {
  flex: 1;
}

.detail-info h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}

.detail-price, .detail-stock, .detail-service-type {
  margin-bottom: 10px;
  font-size: 14px;
}

.price-label, .stock-label, .service-type-label, .score-label {
  font-weight: bold;
  color: #606266;
  margin-right: 5px;
}

.price-value {
  color: #f56c6c;
  font-size: 16px;
  font-weight: bold;
}

.detail-description, .recommendation-reason {
  margin: 15px 0;
}

.detail-description h4, .recommendation-reason h4 {
  font-size: 16px;
  margin-bottom: 8px;
  color: #303133;
}

.detail-description p, .recommendation-reason p {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.recommendation-score {
  margin-top: 20px;
}

.service-detail {
  text-align: center;
}

.service-icon-large {
  font-size: 60px;
  color: #409EFF;
  margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
  .recommendation-input {
    flex-direction: column;
  }
  
  .recommendation-input .el-input {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .recommendation-card {
    flex-direction: column;
  }
  
  .card-header {
    width: 100%;
    height: 180px;
  }

  .detail-dialog-content {
    flex-direction: column;
  }
  
  .detail-image-container {
    width: 100%;
    height: auto;
    aspect-ratio: 1/1;
  }
}
</style>

quickSuggestions: [
  '我想要一只活泼的小狗',
  '我想领养一只安静的猫咪', 
  '我想要一只会说话的鹦鹉',
  '我想要一只适合公寓养的宠物',
  '我想要一只适合陪伴老人的宠物'
]
}

<style scoped>
.recommendation-container {
  padding: 20px;
  max-width: 1200px;
  margin: 0 auto;
  background-color: #fff;
  border-radius: 12px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  border: 1px solid rgba(248, 187, 208, 0.5);
}

.recommendation-header h2 {
  font-size: 24px;
  font-weight: 600;
  color: #e91e63;
  margin: 0;
  position: relative;
}

.recommendation-subtitle {
  color: #666;
  margin-top: 10px;
}

.recommendation-input {
  display: flex;
  flex-direction: column;
  margin-bottom: 30px;
}

.recommendation-input .el-input {
  margin-bottom: 15px;
}

.recommendation-type-selector {
  margin: 15px 0;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.8);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.type-title {
  font-weight: 500;
  margin-bottom: 10px;
  color: #333;
}

.el-radio-group {
  display: flex;
  flex-wrap: wrap;
  gap: 15px;
}

.el-button {
  margin-top: 15px;
  width: 100%;
  max-width: 200px;
  align-self: center;
}

.recommendation-loading {
  padding: 20px;
}

.recommendation-result {
  margin-top: 20px;
}

.recommendation-explanation {
  margin-bottom: 20px;
  padding: 15px;
  background-color: #fdf2f8;
  border-radius: 12px;
  border: 1px solid rgba(248, 187, 208, 0.5);
  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.02);
}

.recommendation-explanation h3 {
  color: #e91e63;
  font-size: 18px;
  margin-top: 0;
  margin-bottom: 10px;
}

.recommendation-item {
  margin-bottom: 25px;
}

.recommendation-item h4 {
  font-size: 20px;
  font-weight: 600;
  color: #e91e63;
  margin-bottom: 15px;
  position: relative;
}

.recommendation-card {
  display: flex;
  border: 1px solid rgba(248, 187, 208, 0.8);
  border-radius: 12px;
  overflow: hidden;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.03);
  margin-bottom: 15px;
  transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.recommendation-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.card-header {
  position: relative;
  width: 180px;
  min-height: 180px;
  background-color: #f5f7fa;
  overflow: hidden;
}

.pet-image, .goods-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
  transition: transform 0.3s ease;
}

.card-header:hover .pet-image,
.card-header:hover .goods-image {
  transform: scale(1.05);
}

.service-header {
  display: flex;
  align-items: center;
  justify-content: center;
}

.service-icon {
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 48px;
  color: #e91e63;
  transition: transform 0.3s ease;
}

.service-header:hover .service-icon {
  transform: scale(1.1);
}

.no-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.score-badge {
  position: absolute;
  top: 10px;
  right: 10px;
  background-color: rgba(233, 30, 99, 0.8);
  color: white;
  padding: 4px 8px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: bold;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.card-content {
  flex: 1;
  padding: 15px;
}

h5 {
  margin: 0 0 8px 0;
  font-size: 16px;
}

.pet-info, .price, .service-info {
  font-size: 14px;
  color: #606266;
  margin-bottom: 8px;
}

.reason {
  font-size: 14px;
  color: #303133;
  margin-bottom: 15px;
  line-height: 1.4;
}

.detail-btn {
  margin-top: 10px;
  background-color: #e91e63;
  border-color: #e91e63;
  transition: all 0.3s ease;
}

.detail-btn:hover, .detail-btn:focus {
  background-color: #c2185b;
  border-color: #c2185b;
  transform: translateY(-2px);
}

.no-recommendations {
  padding: 30px 0;
}

.recommendation-error {
  margin-top: 20px;
}

.detail-dialog-content {
  display: flex;
  gap: 20px;
}

.detail-image-container {
  width: 200px;
  height: 200px;
  overflow: hidden;
  border-radius: 4px;
  background-color: #f5f7fa;
}

.detail-image {
  width: 100%;
  height: 100%;
  object-fit: cover;
}

.no-detail-image {
  display: flex;
  align-items: center;
  justify-content: center;
  height: 100%;
  color: #909399;
  font-size: 14px;
}

.detail-info {
  flex: 1;
}

.detail-info h3 {
  margin-top: 0;
  margin-bottom: 15px;
  font-size: 18px;
  color: #303133;
}

.detail-price, .detail-stock, .detail-service-type {
  margin-bottom: 10px;
  font-size: 14px;
}

.price-label, .stock-label, .service-type-label, .score-label {
  font-weight: bold;
  color: #606266;
  margin-right: 5px;
}

.price-value {
  color: #f56c6c;
  font-size: 16px;
  font-weight: bold;
}

.detail-description, .recommendation-reason {
  margin: 15px 0;
}

.detail-description h4, .recommendation-reason h4 {
  font-size: 16px;
  margin-bottom: 8px;
  color: #303133;
}

.detail-description p, .recommendation-reason p {
  font-size: 14px;
  color: #606266;
  line-height: 1.5;
}

.recommendation-score {
  margin-top: 20px;
}

.service-detail {
  text-align: center;
}

.service-icon-large {
  font-size: 60px;
  color: #409EFF;
  margin-bottom: 15px;
}

@media screen and (max-width: 768px) {
  .recommendation-input {
    flex-direction: column;
  }
  
  .recommendation-input .el-input {
    margin-right: 0;
    margin-bottom: 15px;
  }
  
  .recommendation-card {
    flex-direction: column;
  }
  
  .card-header {
    width: 100%;
    height: 180px;
  }

  .detail-dialog-content {
    flex-direction: column;
  }
  
  .detail-image-container {
    width: 100%;
    height: auto;
    aspect-ratio: 1/1;
  }
}
</style>

quickSuggestions: [
  '我想要一只活泼的小狗',
  '我想领养一只安静的猫咪',