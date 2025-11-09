<template>
  <div class="comment-item">
    <div class="comment-header">
      <el-avatar :size="40" :src="comment.avatar"></el-avatar>
      <div class="comment-meta">
        <span class="comment-author">{{ comment.author }}</span>
        <span class="comment-date">{{ comment.date }}</span>
      </div>
    </div>

    <div class="comment-content">
      {{ comment.content }}
    </div>

    <div class="comment-actions">
      <el-button
        type="text"
        size="small"
        icon="el-icon-thumb"
        :class="{ 'liked': comment.liked }"
        @click="handleLike"
      >
        {{ comment.likes }}
      </el-button>
      <el-button type="text" size="small" icon="el-icon-reply" @click="handleReply">
        回复
      </el-button>
    </div>

    <!-- 回复列表 -->
    <div class="replies-list" v-if="comment.replies && comment.replies.length > 0">
      <comment-item
        v-for="reply in comment.replies"
        :key="reply.id"
        :comment="reply"
        @like="handleReplyLike"
        @reply="handleReplyToReply"
      ></comment-item>
    </div>

    <!-- 回复输入框 -->
    <div class="reply-input" v-if="showReplyInput">
      <el-input
        v-model="replyContent"
        type="textarea"
        rows="2"
        placeholder="写下你的回复..."
      ></el-input>
      <div class="reply-actions">
        <el-button size="small" @click="cancelReply">取消</el-button>
        <el-button size="small" type="primary" @click="submitReply">回复</el-button>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: 'CommentItem',
  components: {
    CommentItem: () => import('./CommentItem.vue') // 递归组件，支持多级评论
  },
  props: {
    comment: {
      type: Object,
      required: true,
      default: () => ({})
    }
  },
  data() {
    return {
      showReplyInput: false,
      replyContent: ''
    }
  },
  methods: {
    handleLike() {
      this.$emit('like', this.comment.id)
    },
    handleReply() {
      this.showReplyInput = true
    },
    cancelReply() {
      this.showReplyInput = false
      this.replyContent = ''
    },
    submitReply() {
      if (!this.replyContent.trim()) return
      if (!this.comment.replies) this.comment.replies = []
      this.comment.replies.push({
        id: Date.now(),
        author: '当前用户',
        avatar: 'https://randomuser.me/api/portraits/women/65.jpg',
        content: this.replyContent,
        date: new Date().toLocaleDateString(),
        likes: 0,
        liked: false,
        replies: []
      })
      this.$message.success('回复成功!')
      this.showReplyInput = false
      this.replyContent = ''
    },
    handleReplyLike(replyId) {
      this.$emit('like', replyId)
    },
    handleReplyToReply() {
      this.showReplyInput = true
    }
  }
}
</script>

<style lang="less" scoped>
.comment-item {
  padding: 15px 0;
  border-bottom: 1px solid #f0f2f5;

  &:last-child {
    border-bottom: none;
  }
}

.comment-header {
  display: flex;
  align-items: center;
  margin-bottom: 8px;
}

.comment-meta {
  margin-left: 10px;
}

.comment-author {
  font-weight: 500;
  color: #303133;
  margin-right: 10px;
}

.comment-date {
  font-size: 12px;
  color: #909399;
}

.comment-content {
  color: #606266;
  margin-bottom: 10px;
  line-height: 1.6;
}

.comment-actions .el-button {
  color: #909399;
  padding: 5px;

  &:hover {
    color: #409eff;
  }
}

.liked {
  color: #f56c6c !important;
}

.replies-list {
  margin-left: 50px;
  margin-top: 10px;
}

.reply-input {
  margin-top: 10px;
  padding: 10px;
  background-color: #f7f8fa;
  border-radius: 4px;
}

.reply-actions {
  text-align: right;
  margin-top: 8px;
}

.reply-actions .el-button {
  margin-left: 8px;
}
</style>