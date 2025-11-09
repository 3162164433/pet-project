<template>
  <div class="post-detail-container">
    <!-- 返回按钮 -->
    <el-button
      type="text"
      icon="el-icon-arrow-left"
      class="back-button"
      @click="$router.go(-1)"
    >
      返回列表
    </el-button>

    <!-- 帖子内容 -->
    <div class="post-detail-card">
      <div class="post-header">
        <el-avatar :size="50" :src="post.avatar"></el-avatar>
        <div class="post-meta">
          <div class="author-info">
            <span class="author-name">{{ post.author }}</span>
            <span class="post-date">{{ post.date }}</span>
          </div>
          <div class="post-tags">
            <el-tag v-for="tag in post.tags" :key="tag">{{ tag }}</el-tag>
          </div>
        </div>
      </div>

      <div class="post-content">
        <h1 class="post-title">{{ post.title }}</h1>
        <div class="post-body">{{ post.content }}</div>
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
        <el-button type="text" icon="el-icon-star-off" @click="handleFavorite">
          收藏
        </el-button>
        <el-button type="text" icon="el-icon-share" @click="handleShare">
          分享
        </el-button>
      </div>
    </div>

    <!-- 评论区 -->
    <div class="comments-section">
      <h2>评论 ({{ comments.length }})</h2>

      <!-- 评论输入框 -->
      <div class="comment-input">
        <el-input
          v-model="newComment"
          type="textarea"
          rows="3"
          placeholder="写下你的评论..."
        ></el-input>
        <div class="comment-submit">
          <el-button type="primary" @click="submitComment">提交评论</el-button>
        </div>
      </div>

      <!-- 评论列表 -->
      <div class="comments-list">
        <comment-item
          v-for="comment in comments"
          :key="comment.id"
          :comment="comment"
          @reply="handleReply"
          @like="handleCommentLike"
        ></comment-item>
      </div>
    </div>
  </div>
</template>

<script>
import CommentItem from '../../components/forum/CommentItem.vue'

export default {
  name: 'PostDetail',
  components: { CommentItem },
  data() {
    return {
      post: {
        id: this.$route.params.id,
        title: '示例帖子标题',
        content: '这是一篇示例帖子的完整内容...\n\n可以包含多行文本和段落。这里将展示帖子的全部内容，而不仅仅是摘要。\n\n用户可以在这里详细描述他们的宠物日常、分享知识或寻求帮助。',
        author: '示例用户',
        avatar: 'https://randomuser.me/api/portraits/women/44.jpg',
        date: '2023-11-15',
        tags: ['日常分享', '猫咪'],
        likes: 24,
        liked: false
      },
      newComment: '',
      comments: [
        {
          id: 1,
          author: '评论用户1',
          avatar: 'https://randomuser.me/api/portraits/men/32.jpg',
          content: '这是一条评论示例',
          date: '2023-11-15',
          likes: 5,
          liked: false,
          replies: [
            {
              id: 11,
              author: '回复用户',
              avatar: 'https://randomuser.me/api/portraits/women/22.jpg',
              content: '这是一条回复',
              date: '2023-11-15',
              likes: 2,
              liked: false
            }
          ]
        },
        {
          id: 2,
          author: '评论用户2',
          avatar: 'https://randomuser.me/api/portraits/men/67.jpg',
          content: '这是另一条评论示例',
          date: '2023-11-16',
          likes: 3,
          liked: false,
          replies: []
        }
      ]
    }
  },
  methods: {
    handleLike() {
      this.post.liked = !this.post.liked
      this.post.likes += this.post.liked ? 1 : -1
    },
    handleFavorite() {
      this.$message.success('收藏成功!')
    },
    handleShare() {
      this.$message.info('分享功能开发中...')
    },
    submitComment() {
      if (!this.newComment.trim()) return
      this.comments.unshift({
        id: Date.now(),
        author: '当前用户',
        avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
        content: this.newComment,
        date: new Date().toLocaleDateString(),
        likes: 0,
        liked: false,
        replies: []
      })
      this.newComment = ''
      this.$message.success('评论成功!')
    },
    handleReply(commentId) {
      this.$message.info('回复功能开发中...')
    },
    handleCommentLike(commentId) {
      const comment = this.comments.find(c => c.id === commentId)
      if (comment) {
        comment.liked = !comment.liked
        comment.likes += comment.liked ? 1 : -1
      }
    }
  }
}
</script>

<style lang="less" scoped>
.post-detail-container {
  padding: 20px;
}

.back-button {
  margin-bottom: 20px;
  color: #409EFF;
}

.post-detail-card {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  margin-bottom: 30px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
}

.post-header {
  display: flex;
  margin-bottom: 20px;
}

.post-meta {
  margin-left: 15px;
  flex: 1;
}

.author-info {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
}

.author-name {
  font-weight: 500;
  color: #303133;
}

.post-date {
  font-size: 12px;
  color: #909399;
}

.post-tags .el-tag {
  margin-right: 5px;
  background-color: #ecf5ff;
  color: #409eff;
  border-color: #b3d8ff;
}

.post-title {
  font-size: 24px;
  color: #303133;
  margin: 0 0 20px 0;
}

.post-body {
  color: #606266;
  line-height: 1.8;
  margin-bottom: 20px;
}

.post-actions {
  display: flex;
  border-top: 1px solid #f0f2f5;
  padding-top: 15px;
}

.post-actions .el-button {
  margin-right: 20px;
  color: #909399;

  &:hover {
    color: #409EFF;
  }
}

.liked {
  color: #f56c6c !important;
}

.comments-section {
  background: #fff;
  border-radius: 8px;
  padding: 20px;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
}

.comments-section h2 {
  color: #303133;
  margin-top: 0;
  margin-bottom: 20px;
}

.comment-input {
  margin-bottom: 30px;
}

.comment-submit {
  text-align: right;
  margin-top: 10px;
}

.comments-list {
  border-top: 1px solid #f0f2f5;
  padding-top: 20px;
}
</style>