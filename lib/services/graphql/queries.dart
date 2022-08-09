const getAllPosts = """
query {
  posts {
    id
    imageUrl
    price
    # comments {
    #   id
    # }
    details
    likes
    author {
      id
      userName
      avatarUrl
    }
    vehicle { 
      brand
      automatic
      model
      year
      id
    }
  }
}
""";

const getAllComments = """
query{
  comments {
    id
    author { # autor do comentario
      userName
    }
    authorPost { # post ao qual o comentário está inserido
      id
    }
    text
  }
}
""";
