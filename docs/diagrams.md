# Project Diagrams

This document contains Mermaid diagrams visualizing the Rails API project architecture.

## Table of Contents

1. [Entity Relationship Diagram (ERD)](#entity-relationship-diagram-erd)
2. [API Architecture](#api-architecture)
3. [Request Flow](#request-flow)
4. [Database Schema](#database-schema)
5. [Controller Structure](#controller-structure)
6. [Test Structure](#test-structure)

---

## Entity Relationship Diagram (ERD)

```mermaid
erDiagram
    User ||--o{ Post : creates
    User ||--o{ Comment : writes
    Category ||--o{ Post : categorizes
    Post ||--o{ Comment : has
    Post ||--o{ PostTag : has
    Tag ||--o{ PostTag : tagged_in
    
    User {
        int id PK
        string name
        string email UK
        datetime created_at
        datetime updated_at
    }
    
    Category {
        int id PK
        string name UK
        text description
        datetime created_at
        datetime updated_at
    }
    
    Tag {
        int id PK
        string name UK
        datetime created_at
        datetime updated_at
    }
    
    Post {
        int id PK
        string title
        text body
        int user_id FK
        int category_id FK
        datetime created_at
        datetime updated_at
    }
    
    Comment {
        int id PK
        text body
        int user_id FK
        int post_id FK
        datetime created_at
        datetime updated_at
    }
    
    PostTag {
        int id PK
        int post_id FK
        int tag_id FK
        datetime created_at
        datetime updated_at
    }
```

---

## API Architecture

```mermaid
graph TB
    Client[Client Application]
    
    subgraph "Rails API Server"
        Router[Routes]
        
        subgraph "Controllers"
            HC[HealthController]
            UC[UsersController]
            CC[CategoriesController]
            TC[TagsController]
            PC[PostsController]
            CMC[CommentsController]
            PTC[PostTagsController]
        end
        
        subgraph "Concerns"
            EH[ErrorHandler]
        end
        
        subgraph "Models"
            UM[User Model]
            CAM[Category Model]
            TM[Tag Model]
            PM[Post Model]
            COM[Comment Model]
            PTM[PostTag Model]
        end
        
        subgraph "Serializers"
            US[UserSerializer]
            CS[CategorySerializer]
            TS[TagSerializer]
            PS[PostSerializer]
            COS[CommentSerializer]
            PTS[PostTagSerializer]
        end
        
        DB[(SQLite Database)]
    end
    
    Client -->|HTTP Request| Router
    Router --> HC
    Router --> UC
    Router --> CC
    Router --> TC
    Router --> PC
    Router --> CMC
    Router --> PTC
    
    UC -.includes.-> EH
    CC -.includes.-> EH
    TC -.includes.-> EH
    PC -.includes.-> EH
    CMC -.includes.-> EH
    PTC -.includes.-> EH
    
    UC --> UM
    CC --> CAM
    TC --> TM
    PC --> PM
    CMC --> COM
    PTC --> PTM
    
    UM --> US
    CAM --> CS
    TM --> TS
    PM --> PS
    COM --> COS
    PTM --> PTS
    
    UM --> DB
    CAM --> DB
    TM --> DB
    PM --> DB
    COM --> DB
    PTM --> DB
    
    US -->|JSON Response| Client
    CS -->|JSON Response| Client
    TS -->|JSON Response| Client
    PS -->|JSON Response| Client
    COS -->|JSON Response| Client
    PTS -->|JSON Response| Client
```

---

## Request Flow

```mermaid
sequenceDiagram
    participant C as Client
    participant R as Router
    participant Ctrl as Controller
    participant M as Model
    participant S as Serializer
    participant DB as Database
    
    C->>R: GET /posts/51
    R->>Ctrl: PostsController#show
    
    alt Error Handling
        Ctrl->>Ctrl: Include ErrorHandler
    end
    
    Ctrl->>M: Post.includes(:user, :category, :tags)
    M->>DB: SQL Query with JOINs
    DB-->>M: Post data + associations
    M-->>Ctrl: Post object
    
    Ctrl->>S: PostSerializer.new(post)
    S->>S: Serialize post with associations
    S-->>Ctrl: JSON data
    
    Ctrl-->>R: render json: post
    R-->>C: 200 OK + JSON response
    
    Note over C,DB: Success Flow
    
    alt Record Not Found
        M-->>Ctrl: ActiveRecord::RecordNotFound
        Ctrl->>Ctrl: ErrorHandler catches exception
        Ctrl-->>C: 404 Not Found + error JSON
    end
    
    alt Validation Error
        M-->>Ctrl: ActiveRecord::RecordInvalid
        Ctrl->>Ctrl: ErrorHandler catches exception
        Ctrl-->>C: 422 Unprocessable Entity + error JSON
    end
```

---

## Database Schema

```mermaid
graph LR
    subgraph "Core Entities"
        U[Users<br/>id, name, email]
        C[Categories<br/>id, name, description]
        T[Tags<br/>id, name]
    end
    
    subgraph "Content"
        P[Posts<br/>id, title, body<br/>user_id, category_id]
        CM[Comments<br/>id, body<br/>user_id, post_id]
    end
    
    subgraph "Join Table"
        PT[PostTags<br/>id, post_id, tag_id]
    end
    
    U -->|1:N| P
    U -->|1:N| CM
    C -->|1:N| P
    P -->|1:N| CM
    P -->|1:N| PT
    T -->|1:N| PT
    
    style U fill:#e1f5ff
    style C fill:#e1f5ff
    style T fill:#e1f5ff
    style P fill:#fff4e1
    style CM fill:#fff4e1
    style PT fill:#f0f0f0
```

---

## Controller Structure

```mermaid
graph TD
    AC[ApplicationController]
    EH[ErrorHandler Concern]
    
    AC --> HC[HealthController]
    AC --> UC[UsersController]
    AC --> CC[CategoriesController]
    AC --> TC[TagsController]
    AC --> PC[PostsController]
    AC --> CMC[CommentsController]
    AC --> PTC[PostTagsController]
    
    EH -.included in.-> UC
    EH -.included in.-> CC
    EH -.included in.-> TC
    EH -.included in.-> PC
    EH -.included in.-> CMC
    EH -.included in.-> PTC
    
    UC -->|index| UCA[List Users + Pagination]
    UC -->|show| UCB[Get User by ID]
    UC -->|create| UCC[Create User]
    UC -->|update| UCD[Update User]
    UC -->|destroy| UCE[Delete User]
    
    PC -->|index| PCA[List Posts + Pagination]
    PC -->|show| PCB[Get Post with Associations]
    PC -->|create| PCC[Create Post]
    PC -->|update| PCD[Update Post]
    PC -->|destroy| PCE[Delete Post]
    PC -->|tags| PCF[Get Post Tags]
    
    CMC -->|index| CMA[List Comments for Post]
    CMC -->|create| CMB[Create Comment]
    CMC -->|update| CMC1[Update Comment]
    CMC -->|destroy| CMD[Delete Comment]
    
    style AC fill:#e1f5ff
    style EH fill:#ffe1e1
    style HC fill:#e1ffe1
```

---

## Test Structure

```mermaid
graph TB
    subgraph "RSpec Test Suite"
        
        subgraph "Model Tests"
            UT[User Spec<br/>Validations & Associations]
            CT[Category Spec<br/>Validations & Associations]
            TT[Tag Spec<br/>Validations & Associations]
            PT[Post Spec<br/>Validations & Associations]
            CMT[Comment Spec<br/>Validations & Associations]
            PTT[PostTag Spec<br/>Validations & Associations]
        end
        
        subgraph "Request Tests"
            URT[Users Request Spec<br/>API Endpoints]
            PRT[Posts Request Spec<br/>API Endpoints]
        end
        
        subgraph "Test Support"
            FB[FactoryBot Factories]
            FK[Faker Data]
            RH[Rails Helper]
            SH[Spec Helper]
        end
    end
    
    UT --> FB
    CT --> FB
    TT --> FB
    PT --> FB
    CMT --> FB
    PTT --> FB
    
    URT --> FB
    PRT --> FB
    
    FB --> FK
    
    UT --> RH
    CT --> RH
    TT --> RH
    PT --> RH
    CMT --> RH
    PTT --> RH
    URT --> RH
    PRT --> RH
    
    RH --> SH
    
    style UT fill:#e1f5ff
    style CT fill:#e1f5ff
    style TT fill:#e1f5ff
    style PT fill:#e1f5ff
    style CMT fill:#e1f5ff
    style PTT fill:#e1f5ff
    style URT fill:#ffe1e1
    style PRT fill:#ffe1e1
    style FB fill:#e1ffe1
```

---

## API Endpoints Flow

```mermaid
graph LR
    subgraph "Health"
        H1[GET /health]
    end
    
    subgraph "Users API"
        U1[GET /users]
        U2[GET /users/:id]
        U3[POST /users]
        U4[PATCH /users/:id]
        U5[DELETE /users/:id]
    end
    
    subgraph "Categories API"
        C1[GET /categories]
        C2[GET /categories/:id]
        C3[POST /categories]
        C4[PATCH /categories/:id]
        C5[DELETE /categories/:id]
    end
    
    subgraph "Tags API"
        T1[GET /tags]
        T2[GET /tags/:id]
        T3[POST /tags]
        T4[PATCH /tags/:id]
        T5[DELETE /tags/:id]
    end
    
    subgraph "Posts API"
        P1[GET /posts]
        P2[GET /posts/:id]
        P3[POST /posts]
        P4[PATCH /posts/:id]
        P5[DELETE /posts/:id]
        P6[GET /posts/:id/tags]
    end
    
    subgraph "Comments API"
        CM1[GET /posts/:post_id/comments]
        CM2[POST /posts/:post_id/comments]
        CM3[PATCH /comments/:id]
        CM4[DELETE /comments/:id]
    end
    
    subgraph "PostTags API"
        PT1[POST /post_tags]
        PT2[DELETE /post_tags/:id]
    end
    
    style H1 fill:#e1ffe1
    style U1 fill:#e1f5ff
    style U2 fill:#e1f5ff
    style U3 fill:#ffe1e1
    style U4 fill:#fff4e1
    style U5 fill:#ffe1e1
```

---

## Pagination & Filtering Flow

```mermaid
graph TD
    A[Client Request] --> B{Has Filters?}
    
    B -->|Yes| C[Apply Filters]
    B -->|No| D[Get All Records]
    
    C --> E{Filter Type?}
    E -->|user_id| F[Filter by User]
    E -->|category_id| G[Filter by Category]
    E -->|tag| H[Filter by Tag Name]
    
    F --> I[Filtered Collection]
    G --> I
    H --> I
    D --> I
    
    I --> J{Has Pagination?}
    
    J -->|Yes| K[Apply Kaminari]
    J -->|No| L[Use Default per_page=10]
    
    K --> M{Valid per_page?}
    M -->|Yes| N[Use Requested per_page]
    M -->|No max>100| O[Use max 100]
    
    L --> P[Paginated Results]
    N --> P
    O --> P
    
    P --> Q[Add Meta Data]
    Q --> R{Has Results?}
    
    R -->|Yes| S[Serialize with ActiveModel::Serializers]
    R -->|No| T[Return Empty Array]
    
    S --> U[Return JSON with Meta]
    T --> V[Return JSON with Meta]
    
    U --> W[200 OK Response]
    V --> W
    
    style A fill:#e1f5ff
    style W fill:#e1ffe1
    style S fill:#fff4e1
```

---

## Error Handling Flow

```mermaid
graph TD
    A[Request Received] --> B[Controller Action]
    
    B --> C{Operation}
    
    C -->|Success| D[Serialize Data]
    D --> E[Return 200/201 OK]
    
    C -->|Error| F{Error Type?}
    
    F -->|RecordNotFound| G[404 Not Found]
    F -->|RecordInvalid| H[422 Unprocessable Entity]
    F -->|RecordNotDestroyed| I[422 Unprocessable Entity]
    F -->|Other| J[500 Internal Server Error]
    
    G --> K[ErrorHandler Concern]
    H --> K
    I --> K
    J --> K
    
    K --> L[Format Error Response]
    
    L --> M{Error Details?}
    
    M -->|Validation Errors| N[Include Field Errors]
    M -->|Simple Error| O[Include Message Only]
    
    N --> P[JSON Error Response]
    O --> P
    
    P --> Q[Return Error to Client]
    
    style E fill:#e1ffe1
    style G fill:#ffe1e1
    style H fill:#ffe1e1
    style I fill:#ffe1e1
    style J fill:#ffe1e1
    style K fill:#fff4e1
```

---

## Deployment Architecture (Recommended)

```mermaid
graph TB
    subgraph "Client Layer"
        WEB[Web Browser]
        MOBILE[Mobile App]
        API_CLIENT[API Client]
    end
    
    subgraph "CDN/Load Balancer"
        LB[Load Balancer]
    end
    
    subgraph "Application Layer"
        APP1[Rails Server 1]
        APP2[Rails Server 2]
        APP3[Rails Server N]
    end
    
    subgraph "Database Layer"
        PRIMARY[(Primary DB<br/>PostgreSQL)]
        REPLICA[(Read Replica)]
    end
    
    subgraph "Caching Layer"
        REDIS[Redis Cache]
    end
    
    subgraph "Monitoring"
        LOGS[Log Aggregation]
        METRICS[Metrics/APM]
    end
    
    WEB --> LB
    MOBILE --> LB
    API_CLIENT --> LB
    
    LB --> APP1
    LB --> APP2
    LB --> APP3
    
    APP1 --> PRIMARY
    APP2 --> PRIMARY
    APP3 --> PRIMARY
    
    APP1 --> REPLICA
    APP2 --> REPLICA
    APP3 --> REPLICA
    
    APP1 --> REDIS
    APP2 --> REDIS
    APP3 --> REDIS
    
    APP1 --> LOGS
    APP2 --> LOGS
    APP3 --> LOGS
    
    APP1 --> METRICS
    APP2 --> METRICS
    APP3 --> METRICS
    
    style WEB fill:#e1f5ff
    style MOBILE fill:#e1f5ff
    style API_CLIENT fill:#e1f5ff
    style PRIMARY fill:#ffe1e1
    style REDIS fill:#fff4e1
```

---

## How to View These Diagrams

### Option 1: GitHub (Automatic Rendering)
When you push this file to GitHub, all Mermaid diagrams will be automatically rendered.

### Option 2: VS Code
Install the "Markdown Preview Mermaid Support" extension to view diagrams in VS Code.

### Option 3: Online Viewer
Copy any diagram code and paste it into:
- https://mermaid.live/
- https://mermaid.ink/

### Option 4: Documentation Sites
Use with documentation generators like:
- MkDocs with mermaid2 plugin
- Docusaurus
- GitBook

---

**Last Updated:** 2025-10-21  
**Diagrams:** 10  
**Format:** Mermaid

