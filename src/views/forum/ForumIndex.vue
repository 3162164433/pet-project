<template>
  <div class="forum-container">
    <!-- 论坛头部 -->
    <div class="forum-header">
      <h1 class="forum-title">宠物论坛</h1>
      <div class="search-bar">
        <el-input
          v-model="searchQuery"
          placeholder="搜索帖子或标签..."
          prefix-icon="el-icon-search"
          @keyup.enter.native="handleSearch"
        >
          <el-button slot="append" icon="el-icon-search" @click="handleSearch"></el-button>
        </el-input>
      </div>
    </div>

    <!-- 论坛导航 -->
    <el-tabs v-model="activeTab" class="forum-tabs" @tab-click="handleTabChange">
      <el-tab-pane label="日常分享" name="daily"></el-tab-pane>
      <el-tab-pane label="宠物知识" name="knowledge"></el-tab-pane>
      <el-tab-pane label="问题求助" name="help"></el-tab-pane>
    </el-tabs>

    <!-- 发帖按钮 -->
    <div class="post-button-container">
      <el-button type="primary" round @click="showCreatePostDialog">
        <i class="el-icon-edit"></i> 发布新帖
      </el-button>
    </div>

    <!-- 帖子列表 -->
    <div class="posts-list">
      <post-card
        v-for="post in posts"
        :key="post.id"
        :post="post"
        @like="handleLike"
        @comment="handleComment"
        @favorite="handleFavorite"
        @share="handleShare"
      ></post-card>
    </div>

    <!-- 分页 -->
    <div class="pagination-container">
      <el-pagination
        @size-change="handleSizeChange"
        @current-change="handleCurrentChange"
        :current-page="currentPage"
        :page-sizes="[10, 20, 30]"
        :page-size="pageSize"
        layout="total, sizes, prev, pager, next, jumper"
        :total="totalPosts"
      ></el-pagination>
    </div>

    <!-- 发布帖子弹窗 -->
    <el-dialog
      title="发布新帖"
      :visible.sync="createPostDialogVisible"
      width="600px"
      :close-on-click-modal="false"
    >
      <el-form :model="newPost" :rules="postRules" ref="postForm">
        <el-form-item label="标题" prop="title">
          <el-input v-model="newPost.title" placeholder="请输入帖子标题"></el-input>
        </el-form-item>
        <el-form-item label="内容" prop="content">
          <el-input
            v-model="newPost.content"
            type="textarea"
            rows="6"
            placeholder="请输入帖子内容"
          ></el-input>
        </el-form-item>
        <el-form-item label="标签">
          <el-tag-input v-model="newPost.tags" placeholder="输入标签，按回车确认"></el-tag-input>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="createPostDialogVisible = false">取消</el-button>
        <el-button type="primary" @click="submitPost">发布</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
import PostCard from '../../components/forum/PostCard.vue'
import { TagInput } from 'element-ui'

export default {
  name: 'ForumIndex',
  components: {
    PostCard,
    'el-tag-input': TagInput
  },
  data() {
    return {
      searchQuery: '',
      activeTab: 'daily',
      createPostDialogVisible: false,
      currentPage: 1,
      pageSize: 10,
      totalPosts: 0,
      posts: [],
      newPost: {
        title: '',
        content: '',
        tags: []
      },
      postRules: {
        title: [{ required: true, message: '请输入标题', trigger: 'blur' }],
        content: [{ required: true, message: '请输入内容', trigger: 'blur' }]
      }
    }
  },
  mounted() {
    this.loadPosts()
  },
  methods: {
    loadPosts() {
      // 模拟数据加载
      this.posts = Array.from({ length: this.pageSize }, (_, i) => ({
        id: (this.currentPage - 1) * this.pageSize + i + 1,
        title: `${this.getTabName()}帖子 ${this.id}`,
        content: '这是一篇模拟的帖子内容，实际项目中会从API获取数据...',
        author: '用户' + Math.floor(Math.random() * 1000),
        avatar: `https://randomuser.me/api/portraits/men/${Math.floor(Math.random() * 100)}.jpg`,
        date: new Date(Date.now() - Math.floor(Math.random() * 30) * 24 * 60 * 60 * 1000).toLocaleDateString(),
        likes: Math.floor(Math.random() * 100),
        commented: Math.floor(Math.random() * 50),
        tags: ['宠物', this.getTabName().replace('帖子', '')],
        liked: false
      }))
      this.totalPosts = 100 // 模拟总帖子数
    },
    getTabName() {
      switch (this.activeTab) {
        case 'daily': return '日常分享'
        case 'knowledge': return '宠物知识'
        case 'help': return '问题求助'
        default: return ''
      }
    },
    handleSearch() {
      // 搜索功能实现
      console.log('搜索:', this.searchQuery)
      // 实际项目中这里会调用API搜索帖子
    },
    handleTabChange() {
      this.currentPage = 1
      this.loadPosts()
    },
    showCreatePostDialog() {
      this.newPost = {
        title: '',
        content: '',
        tags: []
      }
      this.createPostDialogVisible = true
    },
    submitPost() {
      this.$refs.postForm.validate(valid => {
        if (valid) {
          // 模拟发布帖子
          this.createPostDialogVisible = true
          this.$message.success('帖子发布成功!')
          this.createPostDialogVisible = false
          this.loadPosts()
        }
      })
    },
    handleLike(postId) {
      const post = this.posts.find(p => p.id === postId)
      if (post) {
        post.liked = !post.liked
        post.likes += post.liked ? 1 : -1
      }
    },
    handleComment(postId) {
      this.$router.push(`/front/forum/post/${postId}`)
    },
    handleFavorite(postId) {
      this.$message.success('收藏成功!')
    },
    handleShare(postId) {
      this.$message.info('分享功能开发中...')
    },
    handleSizeChange(val) {
      this.pageSize = val
      this.loadPosts()
    },
    handleCurrentChange(val) {
      this.currentPage = val
      this.loadPosts()
    }
  }
}
</script>

<style lang="less" scoped>
.forum-container {
  padding: 20px;
}

.forum-header {
  display: flex;
  justify-content: space-between;
  align-items: center;
  margin-bottom: 30px;
}

.forum-title {
  color: #409EFF; // 淡蓝色标题
  margin: 0;
}

.search-bar {
  width: 400px;
}

.forum-tabs {
  margin-bottom: 20px;
}

.post-button-container {
  text-align: right;
  margin-bottom: 20px;
}

.posts-list {
  margin-bottom: 30px;
}

.pagination-container {
  text-align: center;
}
</style>