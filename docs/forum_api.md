# 宠物论坛模块接口文档

## 基础信息
- 基础URL: `/api/forum`
- 数据格式: JSON
- 请求头: `Content-Type: application/json`
- 认证方式: Token (需在请求头中添加 `Authorization: Bearer {token}`)

## 1. 帖子管理接口

### 1.1 获取帖子列表
- **接口路径**: `/posts`
- **请求方法**: GET
- **请求参数**:
  | 参数名 | 类型 | 必须 | 描述 |
  |--------|------|------|------|
  | page | number | 否 | 页码，默认1 |
  | limit | number | 否 | 每页数量，默认10 |
  | category | string | 否 | 分类 (daily/knowledge/help) |
  | keyword | string | 否 | 搜索关键词 |
- **响应数据**:
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "total": 100,
    "list": [
      {
        "id": 1,
        "title": "我的猫咪日常",
        "content": "今天猫咪做了...",
        "author": "铲屎官小明",
        "avatar": "https://example.com/avatar.jpg",
        "date": "2023-11-15",
        "likes": 24,
        "commented": 5,
        "tags": ["日常分享", "猫咪"]
      }
    ]
  }
}
```

### 1.2 获取帖子详情
- **接口路径**: `/posts/{id}`
- **请求方法**: GET
- **路径参数**:
  | 参数名 | 类型 | 描述 |
  |--------|------|------|
  | id | number | 帖子ID |
- **响应数据**:
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "id": 1,
    "title": "我的猫咪日常",
    "content": "今天猫咪做了...（完整内容）",
    "author": "铲屎官小明",
    "avatar": "https://example.com/avatar.jpg",
    "date": "2023-11-15",
    "likes": 24,
    "tags": ["日常分享", "猫咪"]
  }
}
```

### 1.3 创建帖子
- **接口路径**: `/posts`
- **请求方法**: POST
- **请求体**:
```json
{
  "title": "新帖子标题",
  "content": "帖子内容详情",
  "category": "daily",
  "tags": ["标签1", "标签2"]
}
```
- **响应数据**:
```json
{
  "code": 200,
  "message": "帖子发布成功",
  "data": {
    "id": 1
  }
}
```

## 2. 互动功能接口

### 2.1 点赞帖子
- **接口路径**: `/posts/{id}/like`
- **请求方法**: POST
- **路径参数**:
  | 参数名 | 类型 | 描述 |
  |--------|------|------|
  | id | number | 帖子ID |
- **响应数据**:
```json
{
  "code": 200,
  "message": "点赞成功",
  "data": {
    "likes": 25
  }
}
```

### 2.2 收藏帖子
- **接口路径**: `/posts/{id}/favorite`
- **请求方法**: POST
- **路径参数**:
  | 参数名 | 类型 | 描述 |
  |--------|------|------|
  | id | number | 帖子ID |
- **响应数据**:
```json
{
  "code": 200,
  "message": "收藏成功",
  "data": {}
}
```

## 3. 评论管理接口

### 3.1 获取帖子评论
- **接口路径**: `/posts/{id}/comments`
- **请求方法**: GET
- **路径参数**:
  | 参数名 | 类型 | 描述 |
  |--------|------|------|
  | id | number | 帖子ID |
- **响应数据**:
```json
{
  "code": 200,
  "message": "success",
  "data": [
    {
      "id": 1,
      "author": "评论用户",
      "avatar": "https://example.com/avatar.jpg",
      "content": "这是一条评论",
      "date": "2023-11-15",
      "likes": 5,
      "replies": [
        {
          "id": 101,
          "author": "回复用户",
          "content": "这是一条回复"
        }
      ]
    }
  ]
}
```

### 3.2 提交评论
- **接口路径**: `/posts/{id}/comments`
- **请求方法**: POST
- **路径参数**:
  | 参数名 | 类型 | 描述 |
  |--------|------|------|
  | id | number | 帖子ID |
- **请求体**:
```json
{
  "content": "评论内容"
}
```
- **响应数据**:
```json
{
  "code": 200,
  "message": "评论成功",
  "data": {
    "id": 2
  }
}
```

## 4. 搜索功能接口

### 4.1 搜索帖子
- **接口路径**: `/search`
- **请求方法**: GET
- **请求参数**:
  | 参数名 | 类型 | 必须 | 描述 |
  |--------|------|------|------|
  | keyword | string | 是 | 搜索关键词 |
  | page | number | 否 | 页码 |
  | limit | number | 否 | 每页数量 |
- **响应数据**:
```json
{
  "code": 200,
  "message": "success",
  "data": {
    "total": 10,
    "list": [
      // 帖子列表，格式同1.1
    ]
  }
}
```