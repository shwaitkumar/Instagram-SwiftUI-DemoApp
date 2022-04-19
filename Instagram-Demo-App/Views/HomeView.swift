//
//  HomeView.swift
//  Instagram-Demo-App
//
//  Created by Shwait Kumar on 19/04/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0.0) {
            HeaderView()
            StoryView()
            Divider()
                .padding(.vertical, 0)
            ScrollView{
                LazyVGrid(columns: [GridItem(.flexible())], spacing: 20) {
                    ForEach(0..<5) { posts in
                        PostView(userIndex: posts + 1, image: "\(posts + 1)")
                    }
                }
                .padding(.vertical)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct HeaderView: View {
    var body: some View {
        HStack {
            Image("logo")
            Spacer()
            HStack(spacing: 20.0) {
                Image("add")
                Image("heart")
                Image("messenger")
            }
        }
        .padding(.vertical, 3)
        .padding(.horizontal, 15)
    }
}

struct StoryView: View {
    var userDataDict = [["name" : "Mary Jane", "pic" : "p1"], ["name" : "Samantha", "pic" : "p2"], ["name" : "Rob Key", "pic" : "p3"], ["name" : "Yulia", "pic" : "p4"], ["name" : "Matt Prior", "pic" : "p5"]]

    var body: some View {
        VStack {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: [GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                ForEach(userDataDict, id: \.self) { userData in
                    VStack {
                        Image(userData["pic"] ?? "")
                            .resizable()
                            .frame(width: 60, height: 60)
                            .scaledToFit()
                            .cornerRadius(30)
                    }
                    .overlay(
                        Circle()
                            .stroke(LinearGradient(colors: [.red, .purple, .orange, .yellow], startPoint: .topLeading, endPoint: .bottomTrailing), lineWidth: 2.3)
                            .frame(width: 64, height: 64)
                    )
                    Text(userData["name"] ?? "")
                        .font(.caption)
                        .frame(maxWidth: 60)
                }
            }
            .padding(.leading, 15)
            .padding(.vertical)
            .frame(height: 110)
        }
        }
        .padding(.top, 10)
        .padding(.bottom, -10)
    }
}
struct PostHeaderView: View {
    var userIndex = 1
    
    var body: some View {
        HStack {
            Image("p\(userIndex)")
                .resizable()
                .frame(width: 34, height: 34)
                .scaledToFit()
                .cornerRadius(17)
            if userIndex == 1 {
                Text("Mary Jane")
                    .font(.body)
            }
            else if userIndex == 2 {
                Text("Samantha")
                    .font(.body)
            }
            else if userIndex == 3 {
                Text("Rob Key")
                    .font(.body)
            }
            else if userIndex == 4 {
                Text("Yulia")
                    .font(.body)
            }
            else {
                Text("Matt Prior")
                    .font(.body)
            }
            Spacer()
            Button {
                print("more button tapped")
            } label: {
                Image("more")
            }
        }
        .padding(.horizontal, 9)
        .padding(.bottom, 5)
    }
}

struct PostImageView: View {
    var image = "1"
    var body: some View {
        Image(image)
            .resizable()
            .frame(width: .infinity)
            .scaledToFit()
    }
}

struct PostButtonsView: View {
    var body: some View {
        HStack {
            Image("heart")
            Image("comment")
            Image("share")
            Spacer()
            Image("bookmark")
        }
        .padding(.horizontal, 12)
        .padding(.vertical, 9)
    }
}

struct LikedBySubView: View {
    var userIndex = 1
    
    var body: some View {
        VStack {
            HStack {
                if userIndex == 1 {
                    Text("Liked by natan117 and others.")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else if userIndex == 2 {
                    Text("Liked by Surya24 and others.")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else {
                    Text("Liked by RedFox and others.")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                Spacer()
            }
            HStack {
                if userIndex == 1 {
                    Text("Home Sweet Home <3")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else if userIndex == 2 {
                    Text("Nature is <3")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else if userIndex == 3 {
                    Text("Found old buddy")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else if userIndex == 4 {
                    Text("#Wanderer")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                else {
                    Text("Freedommmm!! No more lockdowns")
                        .font(.footnote)
                        .frame(width: .infinity)
                }
                Spacer()
            }
        }
        .padding(.horizontal, 12)
    }
}

struct PostView: View {
    var userIndex = 1
    var image = "1"
    
    var body: some View {
        VStack {
            PostHeaderView(userIndex: userIndex)
            PostImageView(image: image)
            PostButtonsView()
            LikedBySubView(userIndex: userIndex)
            HStack(spacing: 7.0) {
                Image("p2")
                    .resizable()
                    .frame(width: 24, height: 24)
                    .scaledToFit()
                .cornerRadius(12)
                Text("Add Comment...")
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .frame(width: .infinity)
                Spacer()
                Text("😍")
                Text("😂")
                Image(systemName: "plus.circle")
                    .foregroundColor(.secondary)
            }
            .frame(width: .infinity)
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
        }
    }
}
