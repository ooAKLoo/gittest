////
////  PhotoViewModel.swift
////  swift_demo
////
////  Created by 杨东举 on 2025/4/15.
////
//
//
//class PhotoViewModel {
//    let images: Observable<[ImageModel]>
//
//    init() {
//        images = fetchImagesFromCloud()
//    }
//
//    private func fetchImagesFromCloud() -> Observable<[ImageModel]> {
//        return Observable.create { observer in
//            // 假设这里是网络请求
//            URLSession.shared.dataTask(with: URL(string: "云盘API")!) { data, _, error in
//                if let error = error {
//                    observer.onError(error)
//                    return
//                }
//                // 解析数据为ImageModel数组
//                let imageModels = parseData(data) // 自定义解析方法
//                observer.onNext(imageModels)
//                observer.onCompleted()
//            }.resume()
//            return Disposables.create()
//        }
//        .subscribe(on: ConcurrentDispatchQueueScheduler(qos: .background)) // 后台线程请求
//        .observe(on: MainScheduler.instance) // 主线程更新UI
//    }
//}
