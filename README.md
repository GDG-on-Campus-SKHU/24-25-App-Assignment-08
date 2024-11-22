
# 🍿 Popular MovieList App 과제
## 🗣️ 과제 설명
7차시, 8차시에 학습한 API 통신 관련 과제입니다. 오픈 API를 이용해 **Popular MovieList App**을 만들어봅니다.  
**현재 인기 있는 MovieListScreen과 해당 영화를 눌렀을 때 그 영화의 세부 정보가 보여질 수 있는 MovieDetailScreen을 구현합니다.**  
선택 과제는 평점을 등록할 수 있는 기능 구현입니다.

> 아래 필수 요구 사항, 선택 요구 사항에 맞춰 구현해주시면 됩니다.  
> 아래 기재된 API 문서에 들어가 해당 API, Response body 값 확인 가능합니다.  
> 그리고 accessToken을 넣어 해당 문서에서 바로 응답 값 확인도 가능합니다.  
> App 부가자료실에 확인 관련으로 올려두었으니, 과제하다 모르시는 분들은 참고하시길 바랍니다.

*cf. 필수 과제인 MovieListScreen과 MovieDetailsScreen은 하나의 API로 가능합니다.  
그리고 선택 과제인 평점을 등록하는 부분은 아래 해당 기재된 URI를 사용하시면 됩니다.  
평점은 `8.5`로 고정하겠습니다.*

---

## ✔️ 필수 요구 사항

관련 API 문서 : [`https://developer.themoviedb.org/reference/movie-popular-list`](https://developer.themoviedb.org/reference/movie-popular-list)  

*두 화면 모두 같은 API 사용 가능합니다.*

- **MovieListScreen**
  - API를 통해 받은 영화들을 볼 수 있는 화면
  - 영화 포스터 사진, 영화 제목, 영화 평점
- **MovieDetailScreen**
  - 영화의 세부 정보를 볼 수 있는 화면
  - 영화 포스터 사진, 영화 제목, 영화 개봉일, 영화 개요
  - 뒤로가기 버튼 (선택 요구 사항을 구현하신 분들은 이 부분은 구현 안 하셔도 됩니다.)

*cf. 예시에서 MovieListScreen은 응답 값 중 **`poster_path`**를 사용하고,  
MovieDatailsScreen에서는 **`backdrop_path`** 를 사용했습니다.*

---

## 👏🏻 선택 요구 사항

관련 API 문서 : [`https://developer.themoviedb.org/reference/movie-add-rating`](https://developer.themoviedb.org/reference/movie-add-rating)  

- **평점 추가 기능**
  - 해당 버튼을 눌렀을 때 관련 API를 이용해 평점(8.5)을 보내면 됩니다.
  - 이번 과제는 통신을 위한 과제이기 때문에 평점은 `8.5`로 통일하겠습니다.

---
### 🤷🏻‍♀️ 예시
*cf.  debugShowCheckedModeBanner: false를 MaterialApp에 적용하면 Debug 배너가 제거됩니다.*
<details><summary>필수 사항 예시
</summary>
<table>
<tr>
<td><img src="https://github.com/user-attachments/assets/6d7a67f5-b5ae-48ed-9a96-c07ebb6a409c" alt="Image 1" width="300"></td>

<td><img src="https://github.com/user-attachments/assets/30afcf33-7d14-44c4-af31-d4c97cfbf1f4" alt="Image 2" width="300"></td>
</tr>
</table>
</details>
<details><summary>추가 과제 실행 예시 
</summary>
<table>
<td><img  src = https://github.com/user-attachments/assets/d7d38ec2-58dd-42b1-ac32-86e9932bb484 width="300"></td>

<td><img src="https://github.com/user-attachments/assets/5f3e8511-8658-4e35-8e64-ea1c621b77ed" alt="Image 2" width="300"></td>
</tr>
</table>


</details>



### 🎯 과제 UI 예시 코드 
*cf. UI는 참고용이고, 안에 추가적으로 정보 관련 요소는 추가해야 합니다.*
<details><summary> MovieListScreen

</summary>

```dart
import 'package:flutter/material.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 앱바: 화면 제목과 스타일 정의
        title: const Text(
          'Popular Movies',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFFDE6B56), // 주요 색상
      ),
      body: GridView.builder(
        // 그리드 레이아웃 설정
        padding: const EdgeInsets.all(8.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // 열 개수
          crossAxisSpacing: 10, // 열 간격
          mainAxisSpacing: 10, // 행 간격
          childAspectRatio: 0.7, // 아이템의 가로세로 비율
        ),
        itemCount: 6, // 더미 아이템 개수
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              // 기존 API 데이터를 통해 디테일 화면으로 이동
            },
            child: Card(
              // 카드 디자인
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              elevation: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    // 이미지
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15.0),
                        topRight: Radius.circular(15.0),
                      ),
                      // 영화 포스터 이미지 
                      child: Image.network(
                        
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: Colors.grey[300],
                            child: const Icon(Icons.broken_image,
                                size: 50, color: Colors.grey),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // 영화 제목
                        const Text(
                          'Movie Title',
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: const [
                            Icon(Icons.star, color: Colors.amber, size: 16),
                            SizedBox(width: 4),
                            // 영화 평점
                            Text(
                              'Rating: 8.5',
                              style: TextStyle(fontSize: 14.0),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
```

</details>
<details><summary> MovieDetailScreen

</summary>


```dart
import 'package:flutter/material.dart';

class MovieDetailScreen extends StatelessWidget {
  const MovieDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // 영화 제목
        title: const Text(
          'Movie Title', 
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        backgroundColor: const Color(0xFFDE6B56), // 주요 색상
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 영화 이미지
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
      
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      height: 200,
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.broken_image,
                        size: 100,
                        color: Colors.grey,
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),

              // 영화 제목
              const Text(
                'Movie Title',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // 평점
              Row(
                children: const [
                  Icon(Icons.star, color: Colors.amber, size: 20),
                  SizedBox(width: 4),
                  Text(
                    'Rating: 8.5 / 10',
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // 개봉일
              const Text(
                'Release Date: 2024-11-25',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // 영화 개요
              const Text(
                'Overview',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is a detailed description of the movie.',
                style: TextStyle(fontSize: 16, height: 1.5),
              ),
              const SizedBox(height: 16),

              // 평점 남기기 버튼
              // cf. 평점 남기고 나서 snackBar는  ScaffoldMessenger.of(context).showSnackBar 요소를 이용하면 됩니다. 
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDE6B56),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    // 평점 추가 로직
                  },
                  child: const Text('Rate Movie'),
                ),
              ),
              const SizedBox(height: 16),

              // 뒤로가기 버튼
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFDE6B56),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Back to List'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
```

</details>