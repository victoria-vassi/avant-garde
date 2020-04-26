require 'faker'

ourLanguages =["English", "French", "German", "Italian", "Spanish", "Chinese", "Russian", "Japanese"]


puts "Seeding 1 dev user, 10 buyers (user), 10 sellers (user) and 10 sellers (user)..."
puts "------------------"

gender = ["Male","Female"].sample
  url = "https://randomuser.me/api/?gender=#{gender}"
  user_serialized = open(url).read
  randomuser = JSON.parse(user_serialized)

dev = User.create(
  email: "harry.bennett.h@gmail.com",
  password: "password",
  first_name:  "Harry",
  last_name: "Bennett",
  birthday: Faker::Date.birthday(min_age: 18),
  languages: "English  #{ourLanguages.sample}",
  phone_number: "+"+randomuser["results"][0]["phone"],
  location: randomuser["results"][0]["location"]["city"] + ", " +randomuser["results"][0]["location"]["country"],
  sex: gender,
  user_image: "#{randomuser["results"][0]["picture"]["medium"]}"
)

10.times do
  gender = ["Male","Female"].sample
  url = "https://randomuser.me/api/?gender=#{gender}"
  user_serialized = open(url).read
  randomuser = JSON.parse(user_serialized)

  user = User.create!(
    email:    Faker::Internet.email,
    password: "password",
    first_name:  Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    birthday: Faker::Date.birthday(min_age: 18),
    languages: "English  #{ourLanguages.sample}",
    phone_number: "+"+randomuser["results"][0]["phone"],
    location: randomuser["results"][0]["location"]["city"] + ", " +randomuser["results"][0]["location"]["country"],
    sex: gender,
    user_image: "#{randomuser["results"][0]["picture"]["medium"]}"
  )

  seller = Seller.create!(
    name:    Faker::Name.name,
    address:  Faker::Address.full_address,
    website: Faker::Internet.url,
  )

  museum = (Faker::Ancient.god)

  renter = Renter.create!(
    name:   "#{museum} Museum",
    address:  Faker::Address.full_address,
    website: "www.#{museum.downcase}museum.com",
  )
end

puts 'Creating 10 art campaigns...'

campaign_attributes = [
   {
    artist: "Gustav Klimt",
    title: "Mäda Primavesi",
    year: "1912–13",
    category: "Painting",
    movement: "Symbolism",
    technique: "Oil on canvas",
    dimension: "149.9 x 110.5 cm",
    description_short: "Meet Mäda! Mäda Primavesi lived with her parents, Otto and Eugenia, in Vienna, Austria.
    The artist Gustav Klimt made this portrait of her over a hundred years ago, when she was about nine years old.
    He sketched Mäda many times 'from life', meaning that she visited his studio and sat and stood in various positions
    while he drew and drew and drew. In the end, Klimt chose to show Mäda in this active standing pose, with one elbow thrust
      out—perhaps because it suited her personality best.",
    description_long: "Mäda Primavesi’s expression and posture convey a remarkable degree of confidence for a nine-year-old girl,
    even one who was, by her own account, willful and a tomboy. Klimt made numerous preliminary sketches for this portrait,
    experimenting with different poses, outfits, and backgrounds before deciding to show Mäda standing tall in a specially-made dress
    amid a profusion of springlike patterns. The picture testifies to the sophisticated taste of her parents, banker and industrialist
    Otto Primavesi and his wife Eugenia, who were ardent supporters of progressive Viennese art and design. In fact, Klimt soon painted
    Eugenia’s portrait (Toyota Municipal Museum of Art, Japan).",
    value_increase_rate: 5.5,
    payout_rate: 0.3,
    funding_status: 45,
    funded: false,
    price: 40000,
    end_date: n = Date.today + 45,
    start_date: n - 60,
    minimum_investment: 200,
    seller: Seller.all.sample,
    renter: Renter.all.sample
   },

   {
    artist: "Paul Gauguin",
    title: "Two Tahitian Women",
    year: "1899",
    category: "Painting",
    movement: "Post-Impressionism",
    technique: "Oil on canvas",
    dimension: "94 x 72.4 cm",
    description_short: "Eugène Henri Paul Gauguin was a French post-Impressionist artist. Unappreciated until after his death,
    Gauguin is now recognized for his experimental use of color and Synthetist style that were distinct from Impressionism.",
    description_long: "As Gauguin brought his work in Tahiti to a close, he focused increasingly on the beauty and serene virtues of
    the native women. In this painting, he depended on sculpturally modeled forms, gesture, and facial expression to vivify
    the sentiments he had used to describe the 'Tahitian Eve" "very subtle, very knowing in her naïveté' and at the same time
    'still capable of walking around naked without shame.' These two figures first appear in the artist's monumental frieze Faa Iheihe
    (Tahitian Pastoral) of 1898 (Tate, London) and again in the even larger Rupe Rupe (The Fruit Harvest) of 1899
    (Pushkin Museum of Fine Arts, Moscow), which he composed for the upcoming Exposition Universelle of 1900.",
    value_increase_rate: 1.8,
    payout_rate: 0.2,
    funding_status: 88,
    funded: false,
    price: 252000,
    end_date: n = Date.today + 12,
    start_date: n - 60,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Claude Monet",
    title: "Woman with a Parasol, Madame Monet and Her Son",
    year: "1875",
    category: "Painting",
    movement: "Impressionist",
    technique: "Oil on canvas",
    dimension: "100 cm × 81 cm",
    description_short: "Woman with a Parasol - Madame Monet and Her Son, sometimes known as The Stroll (French: La Promenade) is an
    oil-on-canvas painting by Claude Monet from 1875. The Impressionist work depicts his wife Camille Monet and their son
    Jean Monet in the period from 1871 to 1877 while they were living in Argenteuil, capturing a moment on a stroll on a windy summer's day",
    description_long: "Monet's light, spontaneous brushwork creates splashes of colour. Mrs Monet's veil is blown by the wind, as is her
    billowing white dress; the waving grass of the meadow is echoed by the green underside of her parasol. She is seen as if from below, with a
    strong upward perspective, against fluffy white clouds in an azure sky. A boy, the Monets' seven-year-old son, is placed further away,
    concealed behind a rise in the ground and visible only from the waist up, creating a sense of depth.
  The work is a genre painting of an everyday family scene, not a formal portrait. The work was painted outdoors, en plein air, and quickly,
   probably in a single period of a few hours[1] It measures 100 × 81 centimetres (39 × 32 in), Monet's largest work in the 1870s, and is
   signed 'Monet 75' in the lower right corner.",
    value_increase_rate: 3.5,
    payout_rate: 0.4,
    funding_status: 100,
    funded: true,
    price: 30000,
    end_date: n = Date.today - 1,
    start_date: n - 90,
    minimum_investment: 200,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Karl Blossfeldt",
    title: "Tellima randiflora",
    year: "1928",
    category: "Photography",
    movement: "New Objectivity",
    technique: "Gelatin silver print",
    dimension: "25.9 × 19.8 cm",
    description_short: "Karl Blossfeldt was a German photographer, sculptor, teacher, and artist who worked in Berlin,
    Germany. He is best known for his close-up photographs of plants and living things, published in 1929 as Urformen der Kunst.
    He was inspired, as was his father, by nature and the ways in which plants grow.",
    description_long: "What made Blossfeldt's work unique was his extreme technical mastery of photography. He specialised in
    macrophotography to enlarge his plant specimens and even designed a camera for this purpose. As a result, everyday garden
    flowers are presented in such a way that their rhythmic forms are emphasised to the extreme and the plants take on new and
    exotic characteristics. Blossfeldt wanted his work to act as a teaching aid and inspiration for architects, sculptors and artists.
    It was his firm belief that only through the close study of the intrinsic beauty present in natural forms, that contemporary art would
    find its true direction.",
    value_increase_rate: 3.5,
    payout_rate: 0.7,
    funding_status: 13,
    funded: false,
    price: 100624,
    end_date: n = Date.today + 60,
    start_date: n - 61,
    minimum_investment: 200,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Georges Seurat",
    title: "A Sunday on La Grande Jatte",
    year: "1884",
    category: "Painting",
    movement: "Pointillism",
    technique: "Pointillist technique",
    dimension: "207.6 cm × 308 cm",
    description_short: "A Sunday Afternoon on the Island of La Grande Jatte (French: Un dimanche après-midi à l'Île de la Grande Jatte)
    painted in 1884, is Georges Seurat's most famous work.[1] It is a leading example of pointillist technique, executed on a large canvas.
    Seurat's composition includes a number of Parisians at a park on the banks of the River Seine.",
    description_long: "Georges-Pierre Seurat (1859–1891) was a French artist and painter. Seurat's paintings were known for vibrancy of
    color and the use of tiny brushstrokes of contrasting colors. His intense interest in line, color, color theory, and optical effects
    formed the basis of Divisionism, whereas the use of layering small brushstrokes and dots formed the basis of Pointillism. His iconic
    late 19th-century painting, A Sunday Afternoon on the Island of La Grande Jatte (1884), paved the way for the initiation of
    Neo-impressionism. ",
    value_increase_rate: 2.4,
    payout_rate: 0.5,
    funding_status: 25,
    funded: false,
    price: 11000,
    end_date: n = Date.today + 7,
    start_date: n - 60,
    minimum_investment: 100,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Edvard Munch",
    title: "Madonna",
    year: "1894",
    category: "Print",
    movement: "Expressionist",
    technique: "Lithographic print",
    dimension: "90 cm × 68 cm",
    description_short: "Originally called Loving Woman, this picture can be taken to symbolize what Munch considered the
    essential acts of the female life cycle: sexual intercourse, causing fertilization, procreation and death.
    Evidence for the first is in the picture itself, an intensified, spiritualized variation in the nude of the 'mating'
    pose, the woman depicted as though recumbent beneath her lover.",
    description_long: "A recognized forerunner of Expressionism, Norwegian painter and printmaker Edvard Munch is renowned for
    his representations of emotion. Associated with the international development of Symbolism, Munch experimented with many different
    themes, palettes, and styles of drawing. Though stylistically influenced by Paul Gauguin and the Nabis, Munch’s subjects are drawn
    from his Scandinavian roots and his own tortured psyche. ",
    value_increase_rate: 4.2,
    payout_rate: 0.4,
    funding_status: 100,
    funded: true,
    price: 350000,
    end_date: n = Date.today - 1,
    start_date: n - 120,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Pierre-Auguste Renoir",
    title: "Woman Reclining, to the Left",
    year: "1906",
    category: "Drawing",
    movement: "Realism",
    technique: "Etching in red-brown (sanguine) on cream Japanese paper",
    dimension: "140 × 199 mm",
    description_short: "Pierre-Auguste Renoir (1841–1919). The young Renoir struggled with his family’s financial circumstances so he
    left music school and started out as an apprentice at a porcelain factory. While he studied art in Paris, he befriended the young
    impressionist painters: Frédéric Bazille, Claude Monet, and Alfred Sisley. In the 1870s, Renoir became one of the leading painters
    in the Impressionism movement. His lively paintings mostly celebrated the beauty of feminine sensuality.",
    description_long: "An interest in strongly delineated forms began to manifest itself in Renoir's style in the latter half of the 1880s;
    thereafter his style underwent a period of transformation as he sought to imbue his forms with a sense of presence through brush
    strokes and color. The nude in a landscape was one of the topics that Renoir most enjoyed grappling with during this period. This
    reclining nude suggests an image from a mythological painting, such as the goddess Venus or a woodland nymph. (Source: The Digital
    Gallery. 1999-2006)",
    value_increase_rate: 3.8,
    payout_rate: 0.5,
    funding_status: 30,
    funded: false,
    price: 20000,
    end_date: n = Date.today + 14,
    start_date: n - 60,
    minimum_investment: 100,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Orlova Maria",
    title: "Purple Sky",
    year: "2010",
    category: "Painting",
    movement: "Abstract",
    technique: "Acrylic",
    dimension: "50.0 x 40.0 cm",
    description_short: "Maria moves between different styles, combining abstraction with figuration. Her concerning
    themes is focused on the color palette. She is bounded with one exception: to avoid dramatism in depicted
    situations. Only the scale between extensive backgrounds and minor human figures or vehicles is constant.
    She has been inspired by Dutch painting, especially by Peter Breughel.",
    description_long: "Maria moves between different styles, combining abstraction with figuration. Her concerning
    themes is focused on the color palette. She is bounded with one exception: to avoid dramatism in depicted
    situations. Only the scale between extensive backgrounds and minor human figures or vehicles is constant.
    She has been inspired by Dutch painting, especially by Peter Breughel.",
    value_increase_rate: 4.9,
    payout_rate: 0.0,
    funding_status: 100,
    funded: true,
    price: 350000,
    end_date: n = Date.today - 30,
    start_date: n - 60,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Steve Johnson",
    title: "Blue Bird",
    year: "2000",
    category: "Painting",
    movement: "Abstract",
    technique: "Acrylic",
    dimension: "29.2 x 15.9 cm",
    description_short: "Life is presented in a universe of fantasies where abstraction and figuration are side by side in
    harmony. Colours and transparency evoke dreamlike effects and bring playful charm to his paintings.",
    description_long: "Life is presented in a universe of fantasies where abstraction and figuration are side by side in
    harmony. Colours and transparency evoke dreamlike effects and bring playful charm to his paintings.",
    value_increase_rate: 2.5,
    payout_rate: 0.2,
    funding_status: 67,
    funded: false,
    price: 150000,
    end_date: n = Date.today + 30,
    start_date: n - 60,
    minimum_investment: 500,
    seller: Seller.all.sample,
    renter: Renter.all.sample
  },
  {
    artist: "Alexander Schimmeck",
    title: "Cubic",
    year: "2004",
    category: "Print",
    movement: "Contemporary",
    technique: "Screenprint in colors",
    dimension: "69.0 x 49.0 cm",
    description_short: "Schimmeck has always been fascinated by how words, colours, patterns and structures can change brutal
    urban environments and their perception. 'Cubic' adorned with geometric patterns and shapes incorporating positive messaging
    hand painted onto plywood.",
    description_long: "Cubism emerged in Paris in early 20th century as the collaborative creation of artists Pablo Picasso
    and Georges Braque. An artistic breakthroughs of the modern age, the style abandoned traditional techniques of
    perspective and foreshortening, instead seeking to capture a multiplicity perspectives in a single artwork using flattened,
    geometric shapes. Here Alexander Schimmeck depicts triangular forms emerging into each other in a colourful symfony",
    value_increase_rate: 7.8,
    payout_rate: 0.2,
    funding_status: 100,
    funded: true,
    price: 23000,
    end_date: n = Date.today - 3,
    start_date: n - 60,
    minimum_investment: 100,
    seller: Seller.all.sample,
    renter: Renter.all.sample,
  }
]

campaign_attributes.each do |campaign|
  Campaign.create!(campaign)
end

puts "Finish creating 10 campaigns"


photo_attributes = [
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897576/Avant%20Garde/Gustav_Klimt_gos9s4.jpg",
    campaign_id: 1
  },
    {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587851247/Avant%20Garde/grammy3_j7ndsm.jpg",
    campaign_id: 1
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897535/Avant%20Garde/Paul_Gauguin_csobwl.jpg",
    campaign_id: 2
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897497/Avant%20Garde/Claude_Monet_cawuva.jpg",
    campaign_id: 3
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897458/Avant%20Garde/Karl_Blossfeldt_ljoqgu.jpg",
    campaign_id: 4
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897415/Avant%20Garde/Georges_Seurat_k6ag88.jpg",
    campaign_id: 5
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897117/Avant%20Garde/Edvard_Munch_f1hntf.jpg",
    campaign_id: 6
  },
    {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897117/Avant%20Garde/Pierre-Auguste_Renoir_s9m5fc.jpg",
    campaign_id: 7
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587831391/Avant%20Garde/orlova-maria-bU8TeXhsPcY-unsplash_x2jpg9.jpg",
    campaign_id: 8
  },
   {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587851247/Avant%20Garde/grammy3_j7ndsm.jpg",
    campaign_id: 8
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587831392/Avant%20Garde/steve-johnson-3Sf_G9m0gcQ-unsplash_boxtjs.jpg",
    campaign_id: 9
  },
  {
    photo: "https://res.cloudinary.com/ddjh71lig/image/upload/v1587897116/Avant%20Garde/Alexander_Schimmeck_vyyslm.jpg",
    campaign_id: 10
  }
]

photo_attributes.each do |photo|
  Image.create!(photo)
end

reviews = ["When can I expect this art to be sold?", "Why is this artwork being sold?", "What inspired the artist to make this artwork?",
"Where does the name come from?", "How much time did it take to make this artwork?", "Can I meet the artist in person?", "Where is the artwork now?",
"When can I expect this funding to be met?", "Do you guys have another piece of artwork coming from this artist?", "Where was this artwork made?",
"Do you think this artwork will be more valuable in the future?", "I am really interested, would love to see this funded!", "When do you think this will be sold?",
"This seems like a nice piece of artwork"]

answers = ["I don't know, its up to funders, and up to you", "because we no longer have space for it!", "The artist was inspired by nature, and world",
  "The name comes from the artist own personal inspiration", "The artwork took several years!", "No, the artist is not able to meet at this time", "The artwork is currently on loan, see details",
  "Sometime soon, hopefully looks like it will be funded", "At this time no, we dont have another piece", "It was made in the artists home", "Yes, absolutely!  We have good a feeling about this",
  "Awesome! We're looking forward to it", "Soon, very soon, again up to you!", "yes it is make an investment today!"]


10.times do |i|

  review = Review.create!(
    username: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    campaign_id: (i+1),
    image_url:"https://randomuser.me/api/portraits/med/men/#{rand(1..10)}.jpg",
    content:reviews[i]
    )

    answer1 = Answer.create!(
      review_id:(review.id),
      content: answers[i]
      )
  end

  10.times do |i|

  review1 = Review.create!(
    username: "#{Faker::Name.first_name} #{Faker::Name.last_name}",
    campaign_id: (i+1),
    image_url:"https://randomuser.me/api/portraits/med/men/#{rand(10..20)}.jpg",
    content:reviews[i+2]
    )

    answer1 = Answer.create!(
      review_id:(review1.id),
      content: answers[i +2]
      )
  end


  puts "Reviews and Answers created"


investments = [
  {
    amount: 500,
    user: dev,
    campaign: Campaign.find(1),
    date: d = Campaign.find(1).start_date,
    status: true
  },
  {
    amount: 230,
    user: dev,
    campaign: Campaign.find(2),
    date: d = Campaign.find(2).start_date,
    status: true
  },
  {
    amount: 410,
    user: dev,
    campaign: Campaign.find(2),
    date: d = Campaign.find(2).start_date + 2,
    status: true
  },
  {
    amount: 180,
    user: dev,
    campaign: Campaign.find(2),
    date: d = Campaign.find(2).start_date + 3,
    status: true
  },
  {
    amount: 1500,
    user: dev,
    campaign: Campaign.find(3),
    date: d = Campaign.find(3).start_date,
    status: true
  },
  {
    amount: 2000,
    user: dev,
    campaign: Campaign.find(4),
    date: d = Campaign.find(4).start_date,
    status: true
  },
  {
    amount: 500,
    user: dev,
    campaign: Campaign.find(6),
    date: d = Campaign.find(6).start_date,
    status: true
  },
]

investments.each do |investment|
  Investment.create!(investment)
  Order.create!(campaign: investment[:campaign], investment: investment[:campaign].investments.last, amount: investment[:campaign].investments.last.amount, user: investment[:user], photo: investment[:campaign].images.first.photo)
end

users = User.all.drop(1)
campaigns = Campaign.all
users.each do |user|
  2.times do
    amount = rand(250...2000)
    campaign = campaigns.sample
    date = Date.today - rand(1..60)
    Investment.create!(amount: amount, campaign: campaign, user: user, date: date)
  end
end

Investment.create!(amount: rand(250...2000), campaign: campaigns.sample, user: users.sample, date: Date.today)

orders = Order.all

orders.each do |order|
  order.state = "paid"
  order.save
end




