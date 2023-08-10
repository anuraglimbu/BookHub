-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 10, 2023 at 02:05 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bookhub-deployed`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `name` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `pass` varchar(40) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`name`, `pass`) VALUES
('admin', 'f865b53623b121fd34ee5426c792e5c33af8c227');

-- --------------------------------------------------------

--
-- Table structure for table `books`
--

CREATE TABLE `books` (
  `book_isbn` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `book_title` varchar(200) COLLATE latin1_general_ci DEFAULT NULL,
  `book_author` varchar(600) COLLATE latin1_general_ci DEFAULT NULL,
  `book_image` varchar(400) COLLATE latin1_general_ci DEFAULT NULL,
  `book_descr` longtext COLLATE latin1_general_ci DEFAULT NULL,
  `book_price` decimal(6,2) NOT NULL,
  `categoryid` int(10) UNSIGNED NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `books`
--

INSERT INTO `books` (`book_isbn`, `book_title`, `book_author`, `book_image`, `book_descr`, `book_price`, `categoryid`, `created_at`) VALUES
('9780007318681', 'The Winner Stands Alone', 'Paulo Coelho', 'the winner stands alone.jpg', 'The Winner Stands Alone is the enthralling new novel by the incomparable Paulo Coelho. The story is set during the Cannes International Film Festival and the entire action plays out over 24 hours. Igor is a wealthy Russian businessman. His wife Ewa left him two years ago and Igor has never really come to terms with their break up, especially as Ewa is now remarried to a famous fashion designer, Hamid Hussein. Igor is insanely jealous and when Ewa left him he told her that he would destroy \'whole worlds\' in order to get her back, and he intends to keep his promise! Igor has followed Ewa and her new husband to Cannes and his plan is to cause as much violence and destruction as possible until Ewa realises how much he loves her and comes back to him. Ewa loved Igor but she was absolutely terrified of him. She knows that Igor has killed people in the past when he was a soldier, but she also knows a dark secret - that he once cold bloodedly murdered a beggar who was bothering them in a restaurant. Igor is clearly unhinged and he will stop at nothing to regain her love and so he goes on a ruthless killing spree until he tracks down Ewa...The star-studded film festival acts as a backdrop to Igor\'s maniacal murdering spree and we are ntroduced to various characters along the way, all of whom are desperately trying to get their big break in the shallow world of show business; Gabriela a young and naive actress who is being exploited by her agent and Jasmine a troubled young Rwandan refugee working as a model. The Winner Stands Alone is a gripping, fast-paced thriller, and Coelho cleverly weaves in elements of social satire, poking fun at our celebrity and money obsessed culture.', '560.00', 11, '2022-11-26 19:19:16'),
('9780008123208', 'And then there were None', 'Agatha Christie', 'And then there were None.jpg', 'The book that topped the international online poll held in Agatha Christieâ€™s 125th birthday year to discover which of her 80 crime books was the worldâ€™s favourite. 1939. Europe teeters on the brink of war. Ten strangers are invited to Soldier Island, an isolated rock near the Devon coast. Cut off from the mainland, with their generous hosts Mr and Mrs U.N. Owen mysteriously absent, they are each accused of a terrible crime. When one of the party dies suddenly they realise they may be harbouring a murderer among their number. The 10 strangers include a reckless playboy, a troubled Harley Street doctor, a formidable judge, an uncouth detective, an unscrupulous mercenary, a God-fearing spinster, two restless servants, a highly decorated general and an anxious secretary. One by one they are picked off. Who will survive? And who is the killer? Copies of an ominous nursery rhyme hang in each room, the murders mimicking the awful fates of its â€˜Ten Little Soldier Boysâ€™. The clear winner in an international online poll held to discover the worldâ€™s favourite Agatha Christie book, this new paperback also coincides with a new 3-part BBC TV adaptation featuring a stellar ensemble cast: Douglas Booth, Charles Dance, Maeve Dermody, Burn Gorman, Anna Maxwell Martin, Sam Neill, Miranda Richardson, Toby Stephens, Noah Taylor and Aidan Turner.', '560.00', 8, '2022-11-26 18:55:34'),
('9780099477464', 'Brave New World', 'Aldous Huxley', 'brave new world.jpg', 'Brave new world is a novel with a science-fiction theme written by bestselling author, aldous huxley, and was first published in 1932 it is set in the far future, in 2540 ad and features a utopian view of the society at that time, with a lot of material dedicated to sleep learning, reproductive technology, and classical conditioning the title is derived from a line in shakespeare\'s the tempestthe book begins with a lengthy introduction, detailing the author\'s views of how he thinks the entire world will function in the far future, in a global society that he terms the world state the individual story only begins in the 7th chapter, where the reader is properly introduced to the story of bernard and lenina, two inhabitants of the world statebernard has a single friend in life, whose name is helmholtz watson bernard and lenina go on a holiday to new mexico where they meet john the savage and linda, both of whom have lived hard lives due to being ostracised by all the people they lived withit is decided that john and linda would accompany bernard and lenina back to the world state when they return, and the rest of brave new world covers the events that occur on their return journey the export edition of this book was published by rhuk in 2004, and is available as a paperback key features: brave new world is a science fiction novel that was first published in 1932brave new world is the story of a couple, namely bernard and lenina, and how their life changes after a holiday in new mexico', '798.00', 11, '2022-11-26 19:20:27'),
('9780141044064', 'No Way Down', 'Graham Bowley', 'No way Down.jpg', 'No Way Downis the the gripping, terrifying story of a brutal struggle for survival on the upper slopes of the Himalayan K2, the world\'s most hostile terrain, by Graham Bowley. K2, August 1st, 2008. Thirty climbers are attempting the summit of the most savage mountain on Earth. They make it. But before they start their descent an ice shelf collapses, sweeping away their ropes. It is dark. Their lines are gone. They are low on oxygen. And it is getting very, very cold. How many will make it down alive? \'A gripping hour-by-hour dissection of events in the Western Himalayas over three deadly days. A fitting shelfmate to the modern classic Into Thin Air. A cracking read\' Sunday Times \'Stories of heroism, sadness and extraordinary endurance against all the odds are woven into a thrilling drama\' Daily Mail \'Unputdownable. A portrait of extreme courage, folly and loss, leavened by a small dose of survival . . . as complete a version of the calamitous story as will probably ever emerge\' Financial Times \'The best mountain-disaster memoir since Into Thin Air\'Mail on Sunday Graham Bowley was born in England in 1968. He is a reporter for the New York Times. He lives in Manhattan with his wife and their two daughters and son.', '798.00', 7, '2022-11-26 18:49:57'),
('9780141183800', 'The \'Wolfman\' and Other cases', 'Sigmund Freud', 'the wolfman and other cases.jpg', '\"This volume contains the case history of five-year-old Little Hans\'s fear of horses; the Ratman\'s violent fears of rats gnawing into his father and lover; and the essay \'Some character types\', in which Freud draws on the work of Shakespeare, Ibsen and Nietzsche to demonstrate different kinds of resistance to therapy. Above all, the case histories show us Freud at work, in his own words.\" --Cover.', '1118.00', 6, '2022-11-26 19:02:28'),
('9780141187433', 'The penguin freud reader', 'Sigmund Freud, Adam Phillips', 'The penguin freud reader.jpg', 'Here are the essential ideas of psychoanalytic theory, including Freudï¿½s explanations of such concepts as the Id, Ego and Super-Ego, the Death Instinct and Pleasure Principle, along with classic case studies like that of the Wolf Man. Adam Phillipsï¿½s marvellous selection provides an ideal overview of Freudï¿½s thought in all its extraordinary ambition and variety. Psychoanalysis may be known as the ï¿½talking cureï¿½, yet it is also and profoundly, a way of reading. Here we can see Freudï¿½s writings as readings and listenings, deciphering the secrets of the mind, finding words for desires that have never found expression. Much more than this, however, The Penguin Freud Reader presents a compelling reading of life as we experience it today, and a way in to the work of one of the most haunting writers of the modern age.', '1118.00', 6, '2022-11-26 19:00:44'),
('9780141439471', 'Frankenstein', 'Mary Wollstonecraft Shelley', 'Frankenstein.jpg', 'Obsessed with creating life itself, Victor Frankenstein plunders graveyards for the material to fashion a new being, which he shocks into life with electricity. But his botched creature, rejected by Frankenstein and denied human companionship, sets out to destroy his maker and all that he holds dear. Mary Shelley\'s chilling Gothic tale was conceived when she was only eighteen, living with her lover Percy Shelley near Byron\'s villa on Lake Geneva. It would become the world\'s most famous work of horror fiction, and remains a devastating exploration of the limits of human creativity. Based on the third edition of 1831, this volume contains all the revisions Mary Shelley made to her story, as well as her 1831 introduction and Percy Bysshe Shelley\'s preface to the first edition. This revised edition includes as appendices a select collation of the texts of 1818 and 1831 together with \'A Fragment\' by Lord Byron and Dr John Polidori\'s \'The Vampyre: A Tale\'.', '400.00', 6, '2022-11-26 18:58:51'),
('9780143423003', 'Your dreams are mine now', 'Ravinder Singh', 'Your dreams are mine now.jpg', 'It canâ€™t be love . . .â€™ he thinks and immediately his heart protests. They are complete opposites! Sheâ€™s a small town girl who takes admission in Delhi University (DU). An idealist, studies are her first priority. Heâ€™s a Delhi guy, seriously into youth politics in the DU. He fights to make his way. Student union elections are his first priority. But then opposites attract as well! A scandal on campus brings them together, they begin to walk the same path and somewhere along, fall in love . . . But their fight against evil comes at a heavy price, which becomes the ultimate test of their lives. Against the backdrop of dominant campus politics, Your Dreams Are Mine Now is an innocent love story that is bound to evoke strong emotions in your heart.\r\n\r\nISBN:9780143423003', '280.00', 4, '2022-11-26 18:54:41'),
('9780156031165', 'Breaking Trail', 'Arlene Blum', 'Breaking Trail.jpg', 'Arlene Blum is a legendary trailblazer by any measure. Defying the climbing establishment of the 1970s, she led the first teams of women on successful ascents of Mt. McKinley and Annapurna, and was the first American woman to attempt Mt. Everest. In her long, adventurous career, she has played a leading role in more than twenty expeditions and forged a place for women in the perilous arena of high-altitude mountaineering. Breaking Trail is the story of Blum\'s journey from her overprotected youth in Chicago to the tops of some of the highest peaks on Earth. Chronicling a life of extraordinary personal and professional achievement, Blum\'s intimate and inspiring memoir explores how her childhood fueled her need to climb -- and how, in turn, her climbing liberated her from her childhood. Each chapter in Breaking Trail begins with a poignant vignette from Blum\'s early life. Using these as starting points, she traces her evolution as a climber, from a hilariously incompetent beginner to an aspiring mountaineer to a successful, confident, and world-renowned expedition leader. Along the way, she takes us to some of the most extreme and exquisite places on the planet, sharing the exhilaration, toil, and danger of climbing high. Blum also relates the story of her scientific career, which, like her mountaineering, challenged gender stereotypes and was filled with singular accomplishments, including the banning of two cancer-causing chemicals and the initiation of an important area of biophysical research. Writing with remarkable candor and introspection, Blum recounts her triumphs and tragedies, and provides a probing look at what drove her to endure extreme physical discomfort -- and even to risk her life -- attempting high, remote summits around the world. In her story, she shares intimate insights into how and why climbers persevere under the harshest circumstances, cope with the deaths of their comrades, and balance their desire for adventure with their personal lives. Complemented with breathtaking personal photos and detailed maps, Breaking Trail is a deeply moving account of how one woman overcame adversity to become one of the world\'s most famous climbers, and a testament to the power of taking risks and pursuing dreams.', '590.00', 7, '2022-11-26 18:46:47'),
('9780241468654', 'Around the World in Eighty Days', 'Jules Verne', 'Around the World in Eighty Days.jpg', 'Verne\'s classic novel of global voyaging One night in the reform club, Phileas Fogg bets his companions that he can travel across the globe in just eighty days. Breaking the well-established routine of his daily life, he immediately sets off for Dover with his astonished valet Passepartout. Passing through exotic lands and dangerous locations, they seize whatever transportation is at hand - whether train or elephant - overcoming set-backs and always racing against the clock. For more than seventy years, Penguin has been the leading publisher of classic literature in the English-speaking world. With more than 1,700 titles, Penguin Classics represents a global bookshelf of the best works throughout history and across genres and disciplines. Readers trust the series to provide authoritative texts enhanced by introductions and notes by distinguished scholars and contemporary authors, as well as up-to-date translations by award-winning translators.', '1278.00', 11, '2022-11-26 19:26:28'),
('9780349141800', 'The Hundred-Year-Old Man Who Climbed Out the Window and Disappeared', 'Jonas Jonasson, Roy Bradbury', 'The Hundred-Year-Old Man Who Climbed.jpg', 'It all starts on the one-hundredth birthday of Allan Karlsson. Sitting quietly in his room in an old peopleâ€™s home, he is waiting for the party he-never-wanted-anyway to begin. The Mayor is going to be there. The press is going to be there. But, as it turns out, Allan is notâ€¦ Slowly but surely Allan climbs out of his bedroom window, into the flowerbed (in his slippers) and makes his getaway. And so begins his picaresque and unlikely journey involving criminals, several murders, a suitcase full of cash, and incompetent police.', '798.00', 10, '2022-11-26 19:29:38'),
('9780552174114', 'Inferno', 'Dan Brown', 'Inferno.jpg', 'Harvard professor of symbology Robert Langdon awakens in an Italian hospital, disoriented and with no recollection of the past thirty-six hours, including the origin of the macabre object hidden in his belongings. With a relentless female assassin trailing them through Florence, he and his resourceful doctor, Sienna Brooks, are forced to flee. Embarking on a harrowing journey, they must unravel a series of codes, which are the work of a brilliant scientist whose obsession with the end of the world is matched only by his passion for one of the most influential masterpieces ever written, Dante Alighieri\'s The Inferno. Dan Brown has raised the bar yet again, combining classical Italian art, history, and literature with cutting-edge science in this sumptuously entertaining thriller.', '638.00', 5, '2022-11-26 19:11:26'),
('9780571338757', 'Milkman', 'Anna Burns', 'Milkman.jpg', 'WINNER OF THE MAN BOOKER PRIZE 2018 SHORTLISTED FOR THE RATHBONES FOLIO PRIZE 2019 SHORTLISTED FOR THE WOMEN\'S PRIZE FOR FICTION 2019 SHORTLISTED FOR THE ORWELL PRIZE FOR POLITICAL FICTION 2019 \'Blazing.\' Daily Telegraph \'Outstanding.\' New Statesman \'A triumph.\' Guardian \'Utterly compelling.\' Irish Times \'The best Booker winner in years.\' Metro In an unnamed city, where to be interesting is dangerous, an eighteen-year-old woman has attracted the unwanted and unavoidable attention of a powerful and frightening older man, \'Milkman\'. In this community, where suggestions quickly become fact, where gossip and hearsay can lead to terrible consequences, what can she do to stop a rumour once it has started? Milkman is persistent, the word is spreading, and she is no longer in control . . .', '798.00', 11, '2022-11-26 19:17:51'),
('9780751536577', 'At first Sight', 'Nicholas Sparks', 'At first Sight.jpg', 'There are a few things Jeremy Marsh was sure heâ€™d never do: heâ€™d never leave New York City; never give his heart away after barely surviving one failed marriage; and never become a parent. Now Jeremy is living in the tiny town of Boone Creek, North Carolina, engaged to Lexie Darnell, the love of his life, and anticipating the start of their family. But just as his life seems to be settling into a blissful pattern, a mysterious and disturbing e-mail sets off a chain of events that will change the course of this young coupleâ€™s relationship. How well do we really know the ones we love? How do we handle the inevitable doubts, fears concerning parenthood, and stumbling blocks that are sometimes placed in our way? Continuing the story of the young couple introduced in Sparksâ€™s bestselling True Believer, this novel captures all the heartbreak, tension, romance and surprises of those who are newly wed. An astonishing tale about the love between a man and a woman and between a parent and a child, At First Sight is about endings that bring new beginnings . . . tragedies that lead to unexpected joy . . . and, most of all, the magic of everlasting love.', '560.00', 4, '2022-11-26 18:56:19'),
('9780786891313', 'There\'s no place like here', 'Cecelia Ahern', 'There\'s no place like here.jpg', 'From the bestselling author of P.S. I LOVE YOU and LOVE, ROSIE, comes a tale of a woman who learns that sometimes it takes losing everything to truly find yourself...Since Sandy Shortt\'s childhood classmate disappeared twenty years ago, Sandy has been obsessed with missing things. Finding what is lost becomes her single-minded goal--from the lone sock that vanishes in the washing machine to the car keys she misplaced. It\'s no surprise, then, that Sandy\'s life\'s work becomes finding people who have vanished from their loved ones. Sandy\'s family is baffled and concerned by her increasing preoccupation. Her parents can\'t understand her compulsion, and she pushes them away further by losing herself in the work of tracking down these missing people. She gives up her life in order to offer a flicker of hope to devastated families...and escape the disappointments of her own.Jack Ruttle is one of those devastated people. It\'s been a year since his brother Donal vanished into thin air, and he has enlisted Sandy Shortt to find him. But before she is able to offer Jack the information he so desperately needs, Sandy goes missing too...and Jack now finds himself searching for his brother and the one woman who understood his pain.One minute Sandy is jogging through the park, the next, she can\'t figure out where she is. The path is obscured. Nothing is familiar. A clearing up ahead reveals a camp site, and it\'s there that Sandy discovers the impossible: she has inadvertently stumbled upon the place-- and people--she\'s been looking for all her life, a land where all the missing people go. A world away from her loved ones and the home she ran from for so long, Sandy soon resorts to her old habit again, searching.', '350.00', 5, '2022-11-26 19:06:31'),
('9781398505278', 'Aristotle and Dante Dive Into the Waters of the World', 'Benjamin ALire Saenz', 'Aristotle and Dante Dive Into the.jpg', 'The highly anticipated sequel to the beloved cult classic about family, friendship and first love, from award-winning author Benjamin Alire Saenz. This lyrical novel will enrapture readers of Adam Silvera (They Both Die at the End), The Perks of Being a Wallflower and Call me by your Name. A love story like no other. In Aristotle and Dante Discover the Secrets of the Universe, two boys fell in love. Now they must discover what it means to stay in love and build a relationship in a world that seems to challenge their very existence. Ari has spent all of high school hiding who he really is, staying silent and invisible. He expected his senior year to be the same. But something in him cracked open when he fell in love with Dante, and he can\'t go back. Suddenly he finds himself reaching out to new friends, standing up to bullies and making his voice heard. And, always, there is Dante - dreamy, witty Dante - who can get on Ari\'s nerves and fill him with desire all at once. The boys are determined to forge a path for themselves in a world that doesn\'t understand them. But when Ari is faced with a shocking loss, he\'ll have to fight like never before to create a life that is truthfully, joyfully his own.', '638.00', 3, '2022-11-26 19:10:21'),
('9781405296243', 'Unite Me', 'Tahereh Mafi', 'unite me.jpg', 'Juliette will not stand alone in a battle that will decide that fate of her world... Destroy me: Warner, the ruthless leader of Sector 45, refuses to let her go. Fracture me: Adam, Juliette\'s first love, will do anything to get her back.', '798.00', 9, '2022-11-26 19:11:09'),
('9781471165825', 'The sun and her flowers', 'Rupi Kaur', 'The sun and her flowers.jpg', 'The Sunday Times Number One Bestseller Winner of The GoodReads Choice Award for Poetry 2017 From Rupi Kaur, the bestselling author of Milk and Honey, comes her long-awaited second collection of poetry. Illustrated by Kaur, The Sun and Her Flowers is a journey of wilting, falling, rooting, rising and blooming.', '798.00', 4, '2022-11-26 18:55:35'),
('9781471185090', 'Five Feet Apart', 'Rachael Lippincott, Mikki Daughtry, Tobias Laconis', 'five feet apart.jpg', 'Soon to be a major motion picture starring Cole Sprouse (Riverdale\'sJughead) and Haley Lu Richardson (The Edge of Seventeen and Recovery Road)! In this moving story that\'s perfect for fans of John Green\'s The Fault in Our Stars, two teens fall in love with just one minor complication - they can\'t get within a few feet of each other without risking their lives. Can you love someone you can never touch? Stella Grant likes to be in control - even though her totally out of control lungs have sent her in and out of the hospital most of her life. At this point, what Stella needs to control most is keeping herself away from anyone or anything that might pass along an infection and jeopardize the possibility of a lung transplant. Six feet apart. No exceptions. The only thing Will Newman wants to be in control of is getting out of this hospital. He couldn\'t care less about his treatments, or a fancy new clinical drug trial. Soon, he\'ll turn eighteen and then he\'ll be able to unplug all these machines and actually go see the world, not just its hospitals. Will\'s exactly what Stella needs to stay away from. If he so much as breathes on Stella she could lose her spot on the transplant list. Either one of them could die. The only way to stay alive is to stay apart. But suddenly six feet doesn\'t feel like safety. It feels like punishment. What if they could steal back just a little bit of the space their broken lungs have stolen from them? Would five feet apart really be so dangerous if it stops their hearts from breaking too?', '638.00', 4, '2022-11-26 18:53:23'),
('9781471408656', 'The Wicked King', 'Holly Black', 'The Wicked King.jpg', 'The enchanting and bloodthirsty sequel to the New York Times bestselling novel The Cruel Prince. You must be strong enough to strike and strike and strike again without tiring. The first lesson is to make yourself strong. After the jaw-dropping revelation that Oak is the heir to Faerie, Jude must keep her younger brother safe. To do so, she has bound the wicked king, Cardan, to her, and made herself the power behind the throne. Navigating the constantly shifting political alliances of Faerie would be difficult enough if Cardan were easy to control. But he does everything in his power to humiliate and undermine her even as his fascination with her remains undiminished. When it becomes all too clear that someone close to Jude means to betray her, threatening her own life and the lives of everyone she loves, Jude must uncover the traitor and fight her own complicated feelings for Cardan to maintain control as a mortal in a Faerie world.', '798.00', 9, '2022-11-26 19:08:58'),
('9781471409899', 'House of Hollow', 'Krystal Sutherland', 'House of Hollow.jpg', 'Seventeen-year-old Iris Hollow has always been strange. Something happened to her and her two older sisters when they were children, something they canâ€™t quite remember but that left each of them with an identical half-moon scar at the base of their throats. Iris has spent most of her teenage years trying to avoid the weirdness that sticks to her like tar. But when her eldest sister, Grey, goes missing under suspicious circumstances, Iris learns just how weird her life can get: horned men start shadowing her, a corpse falls out of her sisterâ€™s ceiling, and ugly, impossible memories start to twist their way to the forefront of her mind. As Iris retraces Greyâ€™s last known footsteps and follows the increasingly bizarre trail of breadcrumbs she left behind, it becomes apparent that the only way to save her sister is to decipher the mystery of what happened to them as children. The closer Iris gets to the truth, the closer she comes to understanding that the answer is dark and dangerous â€“ and that Grey has been keeping a terrible secret from her for years.', '638.00', 1, '2022-11-26 18:42:36'),
('9781472240293', 'The Eyes of Darkness', 'Dean Koontz', 'the eye of darkness.jpg', 'Tina Evans dreams that her son Danny is still alive. And when she wakes, she finds a message scrawled on Danny\'s chalkboard: not dead. Tina searches for the truth and learns that there are some things worse than death.', '798.00', 10, '2022-11-26 19:16:22'),
('9781501110344', 'November 9', 'Coleen Hoover', 'november 9.jpg', 'Beloved #1 New York Times bestselling author of It Ends With Us and All Your Perfects returns with an unforgettable love story between a writer and his unexpected muse.Fallon meets Ben, an aspiring novelist, the day before her scheduled cross-country move. Their untimely attraction leads them to spend Fallonâ€™s last day in Los Angeles together, and her eventful life becomes the creative inspiration Ben has always sought for his novel. Over time and amidst the various relationships and tribulations of their own separate lives, they continue to meet on the same date every year. Until one day Fallon becomes unsure if Ben has been telling her the truth or fabricating a perfect reality for the sake of the ultimate plot twist. Can Benâ€™s relationship with Fallonâ€”and simultaneously his novelâ€”be considered a love story if it ends in heartbreak?', '798.00', 3, '2022-11-26 18:49:52'),
('9781501110368', 'it ends with us', 'Colleen Hoover', 'it wnds with us.jpg', 'Instant New York Times Bestseller Combining a captivating romance with a cast of all-too-human characters, Colleen Hooverâ€™s It Ends With Us is an unforgettable tale of love that comes at the ultimate price.Lily hasnâ€™t always had it easy, but thatâ€™s never stopped her from working hard for the life she wants. Sheâ€™s come a long way from the small town in Maine where she grew upâ€”she graduated from college, moved to Boston, and started her own business. So when she feels a spark with a gorgeous neurosurgeon named Ryle Kincaid, everything in Lilyâ€™s life suddenly seems almost too good to be true. Ryle is assertive, stubborn, maybe even a little arrogant. Heâ€™s also sensitive, brilliant, and has a total soft spot for Lily. And the way he looks in scrubs certainly doesnâ€™t hurt. Lily canâ€™t get him out of her head. But Ryleâ€™s complete aversion to relationships is disturbing. Even as Lily finds herself becoming the exception to his â€œno datingâ€ rule, she canâ€™t help but wonder what made him that way in the first place. As questions about her new relationship overwhelm her, so do thoughts of Atlas Corriganâ€”her first love and a link to the past she left behind. He was her kindred spirit, her protector. When Atlas suddenly reappears, everything Lily has built with Ryle is threatened.', '798.00', 3, '2022-11-26 18:46:06'),
('9781509800193', '438 Days', 'Jonathan franklin', '438 Days.jpg', 'On 17th November, 2012, Salvador Alvarenga left the coast of Mexico for a two-day fishing trip. A vicious storm killed his engine and the current dragged his boat out to sea. The storm picked up and carried him West, deeper into the heart of the Pacific Ocean. Alvarenga would not touch solid ground again for 14 months. When he was washed ashore on January 30th, 2014, he had drifted over 9,000 miles. Three dozen cruise ships and container vessels passed nearby. Not one stopped for the stranded fisherman. He considered suicide on multiple occasions - including offering himself up to a pack of circling sharks. But Alvarenga developed a method of survival that kept his body and mind intact long enough for the Pacific Ocean to spit him up onto a remote palm-studded island. Crawling ashore, he was saved by a local couple living in their own private castaway paradise. Based on dozens of hours of interviews with Alvarenga and his colleagues, search and rescue officials, the medical team that saved his life and the remote islanders who nursed him back to normality, 438 Days by Jonathan Franklin is an epic tale of survival and one man\'s incredible story of beating the ultimate odds.', '798.00', 7, '2022-11-26 18:50:43'),
('9781529040821', 'Hidden in plain sight', 'Jeffery Archer', 'hidden in plain sight.jpg', 'Hidden in Plain Sight is the second brilliant and captivating novel featuring William Warwick by the master storyteller and bestselling author of the Clifton Chronicles, Jeffrey Archer. William Warwick has been promoted to Detective Sergeant, but his promotion means that he, along with the rest of his team, have been reassigned to the Drugs Squad. They are immediately tasked with apprehending Ahmed Rashedi, a notorious drug dealer, who operates his extensive network out of South London. As the investigation progresses, William runs into enemies old and new: Adrian Heath, from his school days, now a street dealer who he convinces to turn informer; and financier Miles Faulkner, who makes a mistake that could finally see him put behind bars. Meanwhile, William and his fiancee Beth enjoy making preparations for their upcoming wedding, though an unpleasant surprise awaits them at the altar. As William\'s team closes the net around a criminal network like none they have ever faced before, he devises a trap they would never expect, one that is hidden in plain sight . . . With Jeffrey Archer\'s trademark twists and turns Hidden in Plain Sight is the extraordinary sequel to Nothing Ventured, the first novel featuring William Warwick.', '720.00', 5, '2022-11-26 19:07:32'),
('9781529391534', 'If It Bleeds', 'Stephen King', 'If It Bleeds.jpg', 'News people have a saying: \'If it bleeds, it leads\'. And a bomb at Albert Macready Middle School is guaranteed to lead any bulletin. Holly Gibney of the Finders Keepers detective agency is working on the case of a missing dog - and on her own need to be more assertive - when she sees the footage on TV. But when she tunes in again, to the late-night report, she realises there is something not quite right about the correspondent who was first on the scene. So begins \'If It Bleeds\', a stand-alone sequel to the No. 1 bestselling THE OUTSIDER featuring the incomparable Holly on her first solo case - and also the riveting title story in Stephen King\'s brilliant new collection. Dancing alongside are three more wonderful long stories from this \'formidably versatile author\' (The Sunday Times) - \'Mr Harrigan\'s Phone\', \'The Life of Chuck\' and \'Rat\'. All four display the richness of King\'s storytelling with grace, humour, horror and breathtaking suspense. A fascinating Author\'s Note gives us a wonderful insight into the origin of each story and the writer\'s unparalleled imagination', '1278.00', 1, '2022-11-26 18:45:05'),
('9781612620244', 'Attack on Titan 1', 'Hajime Isayama', 'Attack on Titan 1.jpg', 'In this post-apocalytpic sci-fi story, humanity has been devastated by the bizarre, giant humanoids known as the Titans. Little is known about where they came from or why they are bent on consuming mankind. Seemingly unintelligent, they have roamed the world for years, killing everyone they see. For the past century, what\'s left of man has hidden in a giant, three-walled city. People believe their 100-meter-high walls will protect them from the Titans, but the sudden appearance of an immense Titan is about to change everything. Winner of the 2011 Kodansha Manga Award (Shonen) and nominated for the prestigious Osamu Tezuka Cultural Prize for 2012. The megahit Attack on Titan anime finally returns, streaming on April 1!', '1278.00', 1, '2022-11-26 18:41:18'),
('9781632360564', 'A Silent Voice 1', 'Yoshitoki Oima', 'A Silent Voice 1.jpg', 'LEARNING TO LISTENShoya is a bully. When Shoko, a girl who can\'t hear, enters his elementary school class, she becomes their favorite target, and Shoya and his friends goad each other into devising new tortures for her. But the children\'s cruelty goes too far. Shoko is forced to leave the school, and Shoya ends up shouldering all the blame. Six years later, the two meet again. Can Shoya make up for his past mistakes, or is it too late? Read the manga industry insiders voted their favorite of 2014! \"A very powerful story about being different and the consequences of childhood bullying... Read it.\" -Anime News Network\"The word heartwarming was made for manga like this.\" -Manga Bookshelf', '1278.00', 1, '2022-11-26 18:43:24'),
('9781780742304', 'Everest 1953', 'Mick Conefrey', 'Everest 1953.jpg', 'On the morning of 2 June 1953, the day of Queen Elizabethâ€™s coronation, the first news broke that Everest had finally been conquered. Drawing on first-hand interviews and unprecedented access to archives, this is a ground-breaking new account of that extraordinary first ascent. Revealing that what has gone down in history as a supremely well-planned expedition was actually beset by crisis and controversy, Everest 1953 recounts a bygone age of self-sacrifice and heroism, using letters and personal diaries to reveal the immense stress and heartache the climbers often hid from their fellow team members. Charting how the ascent affected the original team Â­in subsequent years and detailing its immense cultural impact today, \'Everest 1953\' is the perfect book to commemorate this remarkable feat of the human will.', '798.00', 7, '2022-11-26 18:49:09'),
('9781786332271', 'Sex and Vanity', 'Kevin Kwan', 'sex and vanity.jpg', '\"On her very first morning on the jewel-like island of Capri, Lucie Churchill sets eyes on George Zao and she instantly canâ€™t stand him. She canâ€™t stand it when he gallantly offers to trade hotel rooms with her so that she can have the view of the Tyrrhenian Sea, she canâ€™t stand that he knows more about Curzio Malaparte than she does, and she really canâ€™t stand it when he kisses her in the darkness of the ancient ruins of a Roman villa and they are caught by her snobbish, disapproving cousin, Charlotte. â€œYour mother is Chinese so itâ€™s...', '1118.00', 10, '2022-11-26 19:17:22'),
('9781909531369', 'I am the messenger', 'Markus Zusak', 'i am the messenger.jpg', 'From the author of the book thief comes this darkly funny and ultimately uplifting thriller which proves that anyone can be extraordinary. Ed kennedy is just your less-than-average joe who is hopelessly in love with his best friend, audrey. But after he single-handedly manages to catch a bank robber, he receives a playing card in the mail: the ace of diamonds. This is the first message. Four more will follow.', '638.00', 5, '2022-11-26 19:03:57'),
('9781909531611', 'The Book Thief', 'Markus Zusak', 'The Book Thief.jpg', 'SPECIAL 10TH ANNIVERSARY EDITION with exclusive extra behind-the-scenes material from the author It is 1939. In Nazi Germany, the country is holding its breath. Death has never been busier - and will become busier still. By her brother\'s graveside, Liesel\'s life is changed forever when she picks up a single object, abandoned in the snow. It is The Gravedigger\'s Handbook, and this is her first act of book thievery. So begins Liesel\'s love affair with books and words, and soon she is stealing from Nazi book-burnings, the mayor\'s wife\'s library . . . wherever there are books to be found. But these are dangerous times, and when Liesel\'s foster family hides a Jew in their basement, nothing will ever be the same again. In superbly crafted writing that burns with intensity, award-winning author Markus Zusak has given us one of the most enduring stories of our time. Now a major film from Twentieth-Century Fox starring Geoffrey Rush and Emily Watson.', '638.00', 8, '2022-11-26 18:53:59'),
('9788183630078', 'The Complete Jungle Book', 'Rudyard Kipling', 'The Complete Jungle Book.jpg', 'Rudyard Kipling s The jungle book revolves around the child Mowgli who is brought up by wolves. The book portrays the natural world and especially its creatures in a logical anthropomorphized manner, entertaining to adult and child.', '152.00', 8, '2022-11-26 18:52:57'),
('9788194581451', 'Jane Eyre', 'Charlotte Bronte', 'Jane Eyre.jpg', 'Introduction and Notes by Dr Sally Minogue, Canterbury Christ Church University College. \'Jane Eyre\' ranks as one of the greatest and most perennially popular works of English fiction. Although the poor but plucky heroine is outwardly of plain appearance, she possesses an indomitable spirit, a sharp wit and great courage. She is forced to battle against the exigencies of a cruel guardian, a harsh employer and a rigid social order. All of which circumscribe her life and position when she becomes governess to the daughter of the mysterious, sardonic and attractive Mr Rochester. However, there is great kindness and warmth in this epic love story, which is set against the magnificent backdrop of the Yorkshire moors. Ultimately the grand passion of Jane and Rochester is called upon to survive cruel revelation, loss and reunion, only to be confronted with tragedy. AUTHOR: Charlotte Bronte (1816-1855) was oldest of the three Bronte sisters to achieve fame. Her first published novel \'Jane Eyre\' remains her most popular work, but her subsequent books, \'Shirley\', \'Villette\' and the posthumously-published \'The Professor\' are all highly rated.', '478.00', 8, '2022-11-26 18:52:07'),
('9789381841754', 'The Diary of a young girl', 'Anne Frank', 'the diary of young girl.jpg', 'Anne Frank\'s extraordinary diary, written in the Amsterdam attic where she and her family hid from the Nazis for two years, has become a world classic and a timeless testament to the human spirit. Now, in a new edition enriched by many passages originally withheld by her father, we meet an Anne more real, more human, and more vital than ever. Here she is first and foremost a teenage girlâ€”stubbornly honest, touchingly vulnerable, in love with life. She imparts her deeply secret world of soul-searching and hungering for affection, rebellious clashes with her mother, romance and newly discovered sexuality, and wry, candid observations of her companions. Facing hunger, fear of discovery and death, and the petty frustrations of such confined quarters, Anne writes with adult wisdom and views beyond her years. Her story is that of every teenager, lived out in conditions few teenagers have ever known.', '200.00', 4, '2022-11-26 19:01:34'),
('9789937893152', 'Summer Love', 'Subin Bhattarai, Pratima Sharma', 'summer love.jpg', 'At the Central Department of Environmental Science to check the result of the entrance examinations for a Masterâ€™s program, Atit sees a name on top of the list: Saaya. The name itself fascinates him and he tries to give face to the name. When he finally sees her, he is immediately floored by her Cadbury lips, sexy figure and intellect and thus begins their college romance. The romance blossoms into love. But does their love story end on a happy note?', '300.00', 3, '2022-11-26 18:51:11');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `categoryid` int(10) UNSIGNED NOT NULL,
  `category_name` varchar(60) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`categoryid`, `category_name`) VALUES
(1, 'Horror'),
(3, 'Fiction'),
(4, 'Love'),
(5, 'Mystery'),
(6, 'Modern Classic'),
(7, 'Action and Adventure'),
(8, 'Classic'),
(9, 'Fantasy'),
(10, 'Humour'),
(11, 'Literature');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `userid` int(10) UNSIGNED NOT NULL,
  `amount` decimal(6,2) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `ship_name` char(60) COLLATE latin1_general_ci NOT NULL,
  `ship_address` char(80) COLLATE latin1_general_ci NOT NULL,
  `ship_city` char(30) COLLATE latin1_general_ci NOT NULL,
  `ship_zip_code` char(10) COLLATE latin1_general_ci NOT NULL,
  `completed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderid`, `userid`, `amount`, `date`, `ship_name`, `ship_address`, `ship_city`, `ship_zip_code`, `completed`) VALUES
(1, 2, '1278.00', '2022-11-26 19:57:00', 'Yogesh Dangal', 'Kapan', 'Kathmandu', '000', 0),
(5, 4, '2076.00', '2022-11-27 03:07:02', 'Anurag Limbu Kandangwa', 'Hetauda-5, Sanopokhara', 'Hetauda', '44107', 1),
(6, 2, '1676.00', '2022-11-27 06:15:02', 'Anurag Limbu', 'Sankhamul', 'Kathmandu', '000', 0),
(7, 6, '798.00', '2022-11-27 06:17:19', 'Bishram Sharma Paudel', 'Maharajgunj', 'Kathmandu', '000', 0),
(8, 6, '1360.00', '2022-11-27 02:44:39', 'Bishram Sharma Paudel', 'Maharajgunj', 'Kathmandu', '000', 0);

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `orderid` int(10) UNSIGNED NOT NULL,
  `book_isbn` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `item_price` decimal(6,2) NOT NULL,
  `quantity` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`orderid`, `book_isbn`, `item_price`, `quantity`) VALUES
(1, '9781612620244', '1278.00', 1),
(1, '9781612620244', '1278.00', 1),
(1, '9780099477464', '798.00', 1),
(1, '9781501110368', '798.00', 1),
(5, '9780241468654', '1278.00', 1),
(5, '9780141044064', '798.00', 1),
(1, '9781471409899', '638.00', 2),
(1, '9780141439471', '400.00', 1),
(7, '9780099477464', '798.00', 1),
(8, '9780141439471', '400.00', 2),
(8, '9780008123208', '560.00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(255) NOT NULL,
  `contact` varchar(100) NOT NULL,
  `joined` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `address` varchar(255) NOT NULL,
  `city` varchar(30) NOT NULL,
  `zip_code` varchar(10) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`userid`, `username`, `name`, `email`, `contact`, `joined`, `address`, `city`, `zip_code`, `gender`, `password`) VALUES
(2, 'LEO', 'Yogesh Dangal', 'ydangal5@gmail.com', '9745524945', '2022-11-27 07:23:20', 'Kapan', 'Kathmandu', '000', 'Male', '7c222fb2927d828af22f592134e8932480637c0d'),
(3, 'Ayush', 'Aayush Shrestha', 'ry095745@gmail.com', '9863555494', '2022-11-27 07:27:06', 'Nepal', 'hetauda', '006', 'Male', '7c222fb2927d828af22f592134e8932480637c0d'),
(4, 'anurag', 'Anurag Limbu Kandangwa', 'anuraglimbu2018@gmail.com', '9865013820', '0000-00-00 00:00:00', 'Hetauda-5, Sanopokhara', 'Hetauda', '44107', 'Male', '7c222fb2927d828af22f592134e8932480637c0d'),
(5, 'Dnes', 'Dinesh Khadka', 'dineshkhadka@gmail.com', '9843401110', '2022-11-27 07:23:27', 'Nayabazar', 'Kathmandu', '44600', 'Male', '7c222fb2927d828af22f592134e8932480637c0d'),
(6, 'bishram', 'Bishram Sharma Paudel', 'sharmabishram@gmail.com', '9860474934', '0000-00-00 00:00:00', 'Maharajgunj', 'Kathmandu', '000', 'Male', '7c222fb2927d828af22f592134e8932480637c0d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`name`,`pass`);

--
-- Indexes for table `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`book_isbn`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`categoryid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`userid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `categoryid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `orderid` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `userid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
