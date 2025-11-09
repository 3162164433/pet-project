<template>
  <div class="post-card">
    <div class="post-header">
      <el-avatar :size="40" :src="post.avatar"></el-avatar>
      <div class="post-meta">
        <div class="author-info">
          <span class="author-name">{{ post.author }}</span>
          <span class="post-date">{{ post.date }}</span>
        </div>
        <div class="post-tags">
          <el-tag v-for="tag in post.tags" :key="tag" size="small">{{ tag }}</el-tag>
        </div>
      </div>
    </div>

    <div class="post-content">
      <h3 class="post-title" @click="handleComment">{{ post.title }}</h3>
      <p class="post-excerpt">{{ post.content }}</p>
    </div>

    <div class="post-actions">
      <el-button
        type="text"
        icon="el-icon-thumb"
        :class="{ 'liked': post.liked }"
        @click="handleLike"
      >
        {{ post.likes }} 点赞
      </el-button>
      <el-button type="text" icon="el-icon-comment" @click="handleComment">
        {{ post.commented }} 评论
      </el-button>
      <el-button type="text" icon="el-icon-star-off" @click="handleFavorite">
        收藏
      </el-button>
      <el-button type="text" icon="el-icon-share" @click="handleShare">
        分享
      </el-button>
    </div>
  </div>
</template>

<script>
export default {
  name: 'PostCard',
  props: {
    post: {
      type: Object,
      required: true,
      default: () => ({})
    }
  },
  methods: {
    handleLike() {
      this.$emit('like', this.post.id)
    },
    handleComment() {
      this.$emit('comment', this.post.id)
    },
    handleFavorite() {
      this.$emit('favorite', this.post.id)
    },
    handleShare() {
      this.$emit('share', this.post.id)
    }
  }
}
</script>

<style lang="less" scoped>
.post-card {
  border: 1px solid #e4e7ed;
  border-radius: 8px;
  padding: 16px;
  margin-bottom: 16px;
  transition: all 0.3s ease;
  background-color: #fff;

  &:hover {
    box-shadow: 0 2px 12px rgba(0, 0, 0, 0.08);
    border-color: #c0e0ff;
  }
}

.post-header {
  display: flex;
  align-items: center;
  margin-bottom: 12px;
}

.post-meta {
  margin-left: 12px;
  flex: 1;
}

.author-info {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 4px;
}

.author-name {
  font-weight: 500;
  color: #303133;
}

.post-date {
  font-size: 12px;
  color: #909399;
}

.post-tags {
  display: flex;
  gap: 4px;
}

.post-content {
  margin-bottom: 16px;
}

.post-title {
  font-size: 18px;
  margin: 0 0 8px 0;
  color: #1f2d3d;
  cursor: pointer;

  &:hover {
    color: #409eff;
  }
}

.post-excerpt {
  color: #606266;
  margin: 0;
  display: -webkit-box;
  -webkit-line-clamp: 2;
  -webkit-box-orient: vertical;
  overflow: hidden;
}

.post-actions {
  display: flex;
  justify-content: space-between;
  border-top: 1px solid #f0f2f5;
  padding-top: 12px;
}

.post-actions .el-button {
  color: #909399;

  &:hover {
    color: #409eff;
  }
}

.liked {
  color: #f56c6c !important;
}
</style>