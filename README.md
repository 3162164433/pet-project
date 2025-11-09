# Pet “宠栖汀”宠物领养与宠物服务平台

## 项目概述
PetFamily是一个基于Vue.js构建的宠物管理Web应用，提供宠物领养、寄养、商品购买、论坛交流等功能，旨在为宠物爱好者提供一站式服务平台。

## 功能模块
- **宠物领养**：浏览待领养宠物信息，提交领养申请
- **宠物寄养**：提供宠物临时寄养服务预约
- **商品购买**：宠物用品在线购买商城
- **宠物论坛**：用户交流宠物养护、训练等知识的社区平台
- **宠物服务**：美容、医疗、训练等专业服务预约

## 技术栈
- **前端框架**：Vue 2.6.14
- **UI组件库**：Element UI
- **路由管理**：Vue Router
- **状态管理**：Vuex
- **HTTP工具**：Axios (封装在request.js)
- **构建工具**：Vue CLI

## 安装与启动
### 环境要求
- Node.js 12.x+ 
- npm 6.x+ 或 yarn 1.x+

### 安装步骤
1. 克隆项目到本地
```bash
git clone <repository-url>
cd PetFamily/resource/pet
```

2. 安装依赖
```bash
npm install
# 或
 yarn install
```

3. 启动开发服务器
```bash
npm run serve
```

4. 构建生产版本
```bash
npm run build
```

## 目录结构
```
pet/
├── .gitignore           # Git忽略配置
├── README.md            # 项目根目录说明文档
├── babel.config.js      # Babel配置
├── docs/                # 项目文档
│   ├── forum.sql        # 论坛模块数据库表结构
│   ├── forum_api.md     # 论坛API接口文档
│   ├── pet.sql          # 核心业务数据库表结构
│   └── README.md        # 详细项目文档
├── public/              # 静态资源
├── src/                 # 源代码
│   ├── assets/          # 样式、图片等资源
│   ├── components/      # 公共组件
│   ├── layout/          # 布局组件
│   ├── router/          # 路由配置
│   ├── store/           # 状态管理
│   ├── utils/           # 工具函数
│   ├── views/           # 页面组件
│   ├── App.vue          # 根组件
│   └── main.js          # 入口文件
└── vue.config.js        # Vue CLI配置
```

## 数据库结构
项目使用MySQL数据库，主要数据表结构如下：
- **pet.sql**：包含领养、寄养、用户、商品等核心业务表
- **forum.sql**：包含论坛模块相关表（帖子、评论、点赞、收藏）

## API文档
论坛模块API接口详情请参考：[forum_api.md](forum_api.md)

## 注意事项
- 开发环境下API请求代理配置在vue.config.js中
- 生产环境需配置正确的后端API地址
- 数据库初始化脚本位于docs目录下

## 版权信息
本项目为私有项目，未经授权不得用于商业用途。