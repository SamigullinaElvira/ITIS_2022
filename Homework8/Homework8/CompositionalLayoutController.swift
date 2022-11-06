//
//  CompositionalLayoutController.swift
//  Homework8
//
//  Created by Эльвира Самигуллина on 05.11.2022.
//

import UIKit

class CompositionalLayoutController: UIViewController, UICollectionViewDataSource {
    
    private func headerCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        return section
    }
    
    private func multfilmsCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(250)), subitem: item, count: 2)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .groupPaging
        return section
    }
    
    private func moviesCellSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(240)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(240)), subitem: item, count: 1)
        let section = NSCollectionLayoutSection(group: group)
        let spacing: CGFloat = 20
        section.interGroupSpacing = spacing
        section.contentInsets = .init(top: 20, leading: 0, bottom: 0, trailing: 0)
        return section
    }
    
    private lazy var collectionView: UICollectionView = {
        let configuration = UICollectionViewCompositionalLayoutConfiguration()
        let layout = UICollectionViewCompositionalLayout(
            sectionProvider: { [weak self] section, environment in
                guard let self else { fatalError("Self is nil") }
                guard let section = Section(rawValue: section) else {
                    fatalError("This section: (\(section)) does not exist")
                }
                
                switch section {
                case .headerMultfilms:
                    return self.headerCellSection()
                case .multfilms:
                    return self.multfilmsCellSection()
                case .headerMovies:
                    return self.headerCellSection()
                case .movies:
                    return self.moviesCellSection()
                }
            },
            configuration: configuration
        )
        return UICollectionView(
            frame: .zero, collectionViewLayout: layout
        )
    }()
    
    enum Section: Int, CaseIterable {
        case headerMultfilms
        case multfilms
        case headerMovies
        case movies
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        Section.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch Section(rawValue: section) {
        case .headerMultfilms: return 1
        case .multfilms: return multfilms.count
        case .headerMovies: return 1
        case .movies: return movies.count
        case nil: return 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    private func setup(){
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        collectionView.register(MultfilmsCollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.multfilms)")
        collectionView.register(MoviesCollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.movies)")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.headerMultfilms)")
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "\(Section.headerMovies)")
        
        collectionView.dataSource = self
    }
        
    private struct Film {
        let label: String
        let url: URL
    }
        
    private let multfilms: [Film] = [
        .init(label: "Тайна Коко", url: URL(string: "https://www.youloveit.ru/uploads/posts/2017-09/1506175506_youloveit_ru_taina_koko_postery04.jpg")!),
        .init(label: "Энканто", url: URL(string: "https://www.game-ost.ru/static/covers_soundtracks/3/5/350370_220435.jpg")!),
        .init(label: "Душа", url: URL(string: "https://i.pinimg.com/originals/aa/e8/9c/aae89ca32d9549861fc5b11b3c64701d.jpg")!),
        .init(label: "Головоломка", url: URL(string: "https://i.pinimg.com/474x/74/a0/47/74a04757c708650963fbd63565622419.jpg")!),
        .init(label: "Зверополис", url: URL(string: "https://novostihaipa.ru/wp-content/uploads/2020/01/zvQqY4ksXtB6HEjjewsH3DQzI6g.jpg")!),
        .init(label: "Зверопой 2", url: URL(string: "https://scarfilm.org/wp-content/uploads/2022/01/1920x-2-3.jpg")!),
        .init(label: "Моана", url: URL(string: "https://upload.wikimedia.org/wikipedia/ru/2/26/Moana_Teaser_Poster.jpg")!),
        .init(label: "Ральф против интернета", url: URL(string: "https://upload.wikimedia.org/wikipedia/ru/1/18/Ralph2poster.jpeg")!),
        .init(label: "Я краснею", url: URL(string: "https://upload.wikimedia.org/wikipedia/ru/thumb/9/90/Turning_Red_%282022%29_poster.jpg/548px-Turning_Red_%282022%29_poster.jpg")!),
        .init(label: "Гринч", url: URL(string: "https://oboi-telefon.ru/wallpapers/21312/31433.jpg")!)
    ]
        
    private let movies: [Film] = [
        .init(label: "Фокус Покус 2", url: URL(string: "https://www.kinonews.ru/insimgs/2022/shotimg/shotimg108281_1.jpg")!),
        .init(label: "Доктор Стрэндж: в мультивселенной безумия", url: URL(string: "https://static.wikia.nocookie.net/15f6be2f-2c13-4925-8825-9fbb85c26e2e")!),
        .init(label: "Анчартед: На картах не значится", url: URL(string: "https://blog-st.ru/wp-content/uploads/2022/02/0141b3da8c7f2c50_1920xH.jpg")!),
        .init(label: "Главный герой", url: URL(string: "https://cdn.lifehacker.ru/wp-content/uploads/2019/12/Ryan-Reynolds-in-Free-Guy_1575750904.jpg")!),
        .init(label: "Человек-паук: нет пути домой", url: URL(string: "https://4kwallpapers.com/images/wallpapers/spider-man-no-way-home-doctor-strange-2021-movies-willem-7680x5596-6975.jpg")!),
        .init(label: "Тор: Любовь и гром", url: URL(string: "https://static.kinoafisha.info/upload/news/318935086796.jpg")!),
        .init(label: "Дом Гуччи", url: URL(string: "https://avatars.mds.yandex.net/get-kinopoisk-post-img/1101236/e35152de376d9e367cab1bd3ed6143cb/1920x1080")!),
        .init(label: "Король Ричард", url: URL(string: "https://thumbs.dfs.ivi.ru/storage4/contents/7/e/eb1751ede228b428b99fc3dc413528.jpg")!),
        .init(label: "Заклятье 3", url: URL(string: "https://images.iptv.rt.ru/images/c6tpocbir4sslltsd900.jpg")!),
        .init(label: "Бэтмен", url: URL(string: "https://img1.akspic.ru/attachments/originals/8/2/9/5/6/165928-the_batman_2022_poster-3840x2161.jpg")!)
    ]
    
    private func cellContentConfiguration(section: Section) -> UIContentConfiguration {
        var configuration = UIListContentConfiguration.cell()
        switch section {
            case .headerMultfilms:
                configuration.text = "Popular Animated Movies"
                configuration.textProperties.font = .boldSystemFont(ofSize: 24)
            case .headerMovies:
                configuration.text = "Movies 2021-2022"
                configuration.textProperties.font = .boldSystemFont(ofSize: 24)
            default:
                return UIListContentConfiguration.cell()
            }
            return configuration
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let section = Section(rawValue: indexPath.section) else { fatalError() }
        
        switch section {
        case .multfilms:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath) as? MultfilmsCollectionViewCell else {fatalError("Could not deque cell of \(section)")}
            let image = multfilms[indexPath.row]
            cell.set(imageUrl: image.url)
            return cell
        case .movies:
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath) as? MoviesCollectionViewCell else {fatalError("Could not deque cell of \(section)")}
            let image = movies[indexPath.row]
            cell.set(label: image.label, imageUrl: image.url)
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(section)", for: indexPath)
            cell.contentConfiguration = cellContentConfiguration(section: section)
            cell.contentView.backgroundColor = .clear
            return cell
        }
    }
}
    

