# MyData API 規格文件

## 前臺網站
- 文件編碼-前置碼： `MD-1`
- 網站 ContextPath： 維持現行規格，url不變

## 維運後台
- 文件編碼-前置碼： `MD-2`
- 網站 ContextPath： 維持現行規格，url不變

## 帳號角色權限服務模組
- 文件編碼-前置碼： `MD-3`
- 反向代理URI： `/backend-uma`

## 單一登入身分驗證(SSO)
- 文件編碼-前置碼： `MD-4`
- 反向代理URI： `/backend-oidc`

## 系統排程模組
- 文件編碼-前置碼： `MD-5`
- 反向代理URI： `/routine-jobs`

## Resource服務模組
- 文件編碼-前置碼： `MD-6`
- External-API 反向代理URI：維持現行規格，對外API的url不變
- Internal-API 反向代理URI： `/mod-resource/api`

## Gateway服務模組
- 文件編碼-前置碼： `MD-7`
- External-API 反向代理URI：維持現行規格，對外API的url不變
- Internal-API 反向代理URI： `/mod-gateway/api`

## 線上表單簽核模組
- 文件編碼-前置碼： `MD-8`
- 反向代理URI： `/form-approval`

## 線上報名及問卷系統
- 反向代理URI： `/event-registration`
### Internal API
- 文件編碼-前置碼： `MD-9I`
- URI： `/event-registration/api`
### External API
- 文件編碼-前置碼： `MD-9E`
- URI： `/event-registration/e-api`
### 後台管理功能網頁
- URI： `/event-registration/backend/`
### 前台-活動線上報名網頁
- 活動線上報名網址： `/event-registration/frontend/activity/signup?id={shortId}`
- 問卷線上填寫網址： `/event-registration/frontend/questionnaire/signup?id={shortId}`

## 缺陷管理系統
- 文件編碼-前置碼： `MD-10`
- 反向代理URI： `/issue-tracking`


