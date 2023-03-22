import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.fastfood_outlined),
          onPressed: () async {
            var f = await FirebaseFirestore.instance.collection('users').get();
            print(f);
          },
        ),
      ),
    );
  }
}













/*
{
              'articles': [
                {
                  'title': '''5 Times That Trash-Talking Backfired In Chess''',
                  'content':
                      ''' There s a famous story in basketball featuring Boston Celtics legend Larry Bird. Before the first-ever Three-Point Shootout in 1986, he went into the locker room, asked who was finishing in second place and walked out. He won the contest.

There's nothing quite like trash-talk paying off if you're the one dishing it out. Of course, if you're the one hearing the trash-talk, there's nothing like seeing it backfire on your opponent. Throughout chess history, that latter possibility tends to play out more often.

While games like basketball or cricket have more scope for trash-talking than chess, that doesn't mean it can't happen in the royal game. It's especially common at clubs, parks, or coffeehouses. In my early years of chess life, I used to go to a club in my town and I can still recall being told during some games to "run, run, run with your king now."

On the professional or competitive level, players used to occasionally undercut other players in a tournament bulletin or newspaper column. These days, Twitter is the preferred medium for pre-match and post-match trash-talking.'''
                },
                {
                  'title': '''Emanuel Lasker (mathematician)''',
                  'content':
                      '''Chess is a game about patterns, so it is not terribly surprising that you can find a number of great chess players who were also mathematicians. Former World Champion GM Max Euwe was a teacher for many years both before and after earning the title in 1935. He was also the FIDE president from 1970-1978. GM John Nunn was a lecturer of math at Oxford University until 1981.

But Emanuel Lasker was the best chess player in the group. During the first period where he did not defend his world championship title (1896-1907), he spent much of his time earning a doctorate in math and doing other work in the field.
Lasker has a mathematical theory named after him, in fact. Most of us have probably never heard of primary decomposition before we were "today years old," but Lasker did his doctoral work on it. What is primary decomposition? It's a pretty simple concept, really: "the Lasker–Noether theorem states that every Noetherian ring is a Lasker ring, which means that every ideal can be decomposed as an intersection, called primary decomposition, of finitely many primary ideals (which are related to, but not quite the same as, powers of prime ideals)." 

Okay, maybe not so simple. Anyway, Lasker proved his part in the theorem in 1905, the same year another German scientist was figuring out other mundane facts about the universe, mundane facts like special relativity and E=mc2. 
Lasker and Albert Einstein became friends much later. If they ever played a game of chess, it went unrecorded, although we can assume Lasker won. Einstein was close enough to Lasker in other ways that he wrote the introduction to a Lasker biography in 1952, after the chess master had passed, to say that "Emanuel Lasker was undoubtedly one of the most interesting people I came to know in my later years." 
'''
                },
                {
                  'title': '''Double The Prize''',
                  'content':
                      '''What if you had to win a chess game to save your life? Well, that was exactly what Russian-French player Ossip Bernstein had to do. He was on the verge of being executed by a firing squad. On the day of his execution, one of the officials recognized his name as he was a chess lover himself. The verbal confirmation wasn't enough, and the official asked Bernstein to prove it by beating him in a game of chess. 

Bernstein won the game and was released. He eventually moved to France and continued his work as a finance lawyer and also kept in touch with chess.

At the age of 72, he was playing in a round-robin tournament. His opponent in the 16th round, GM Miguel Najdorf was leading by half a point. He underestimated Bernstein and believed that he could easily beat him and win the event. He went on to convince the organizer to double the prize money as he was very confident of his victory.'''
                },
                {
                  'title': '''Capablanca's Dry Style Of Play''',
                  'content':
                      '''GM Efim Bogoljubov made some nasty remarks about Jose Capablanca's play in the bulletin of the Moscow 1925 event. Apparently, what many people admire about Capablanca's playing style, making chess seem simple, was not to Bogoljubov's taste.

Capablanca defeated Bogoljubov in their game, but Bogoljubov went on to win the tournament. Their game in particular was discussed heavily, and there were some strong disagreements about the evaluations among the annotators. Edward Winter compiled them all in a wonderful article titled "Analytical Disaccord." 
Since Bogoljubov won the tournament, one could say the Cuban master won the battle but lost the war. That would have been the case if the story ended there. However, we would not be talking about it unless the trash-talker ultimately ended up losing the war, too.

A few years later, Capablanca defeated Bogoljubov in an instructive endgame and proved his strength once again. Defeating someone who has talked trash to or about you publicly can be a satisfying experience indeed.'''
                },
                {
                  'title':
                      '''How would you describe your approach to chess coaching?''',
                  'content':
                      '''I believe people are much more willing to "work" and "train" when they feel a genuine interest in the rich history and culture of chess. I feel like my main goal as a coach is to help students cultivate a curiosity for the game so that they can feel inspired to work on their own, and so that their training stops to feel like actual "work." Rather, it becomes something they look forward to.

There are so many geniuses in chess history, and their games are all out there, ready to be studied. To name a few: Tarrasch, Capablanca, Botvinnik, Tal, Fischer, Geller, Petrosian, Karpov, Kasparov, Ivanchuk, Shirov, Kramnik, Anand, Topalov, Carlsen, Aronian, Caruana, I mean the list goes on and on and on—so many amazing players to choose from. Whatever your favorite opening is, there are probably at least a dozen grandmasters you could study and learn from, who can show you exactly how to play the middlegames you're always seeing.
And there are so many amazing books out there, already written, just waiting to be read. If the curiosity and motivation are there, I think there is very little stopping a truly ambitious player—so my approach to coaching is to encourage a deeper interest in the game, to get my students to not worry about their short-term rating goals, and to combine that with specific and practical advice as to how to actually work on one's chess.'''
                },
                {
                  'title': '''Lasker vs. Pillsbury And/Or Rubinstein''',
                  'content':
                      '''Harry Pillsbury came out of nowhere to win the famous 1895 Hastings tournament, and he did it with some of the most accurate chess that had ever been played up to that point: roughly the equivalent of a modern grandmaster but in an era of minimal opening theory and no computers. Pillsbury—who, along with Frank Marshall, GM Samuel Reshevsky, and GM Reuben Fine, would belong on a "Mount Rushmore" of American players active between Paul Morphy and GM Bobby Fischer—eventually reached an equal lifetime score against the reigning world champion Emanuel Lasker (5-5 with four draws).
      Unfortunately, Lasker accepted no new challengers between 1896 and 1907, and Pillsbury passed away in 1906, already some years past his prime. But he still got one last shot at Lasker and won their game at Cambridge Springs, Pennsylvania, in 1904.

From 1907-10, Lasker did play four world championship matches, facing four players who themselves never became champion: Marshall, Siegbert Tarrasch, Carl Schlechter, and David Janowsky. Lasker beat Marshall and Janowsky 8-0 each and Tarrasch 8-3, while barely retaining his title against Schlechter in a 1-1 match.

In the middle of that run, he met a fifth such never-became-world-champion player at St. Petersburg 1909, probably the strongest of the five: Akiba Rubinstein, who won an instant classic.
It ended being the first of just seven meetings between Lasker and Rubinstein, with Lasker ahead but only 2-1 (four draws). The two were set to play for the championship before World War I broke out. Out of money after the war, when cash for the prize fund was the most important attribute a potential challenger could have, Rubinstein never got his match, and his play gradually declined.
Lasker instead met and lost to Jose Raul Capablanca in 1921. That loss ended Lasker's 27-year reign as world champion, which is still the longest ever. Had he ever faced Pillsbury or Rubinstein, it may have been cut short and the course of chess history changed.
'''
                },
                {
                  'title': '''Capablanca vs. Alekhine: The Rematch''',
                  'content':
                      '''Yes, two players who once contested the world championship are in an article about players who never contested the world championship. When Capablanca played Alexander Alekhine in 1927, Alekhine won in an upset. At 34 games, it was the longest decisive world championship match in chess history. The only longer one was the 1984 match between GM Garry Kasparov and GM Anatoly Karpov that ended without result after 48 games.
      Kasparov and Karpov wound up playing 144 games in five world championship matches and 193 times overall. Can you imagine if we got even half that many Capablanca-Alekhine games? It would never have quite been that many, but still....

Instead, we have to settle for 51 title games between Alekhine and... GM Efim Bogoljubov. Just two years after facing Capablanca, Alekhine defended his title but chose Bogoljubov as his challenger instead. "Bogo" was wiped out by Alekhine, 11-5 with nine draws. Alekhine then waited five years to defend again, and he chose as his opponent: Bogoljubov, again.

This is like if Carlsen got to pick his opponent and kept playing against—ok, it's hard to get out of this sentence without insulting somebody, so just pick your least favorite GM in the world top 25-30.

Anyway, 1934 saw Bogoljubov get crushed again, 8-3 with 15 draws.
'''
                },
                {
                  'title': '''Tal vs. Petrosian''',
                  'content':
                      '''This matchup would have been an epic clash of styles between the attacker GM Mikhail Tal and the defender GM Tigran V. Petrosian. In fact, they each have an argument as being the single greatest attacker and single greatest defender of all time, respectively.
      The dream match almost happened. Depending on how inevitable you think World War I was and how willing you think Fischer actually was to defend in his title in 1975, Tal-Petrosian arguably came the closest to happen of any match in this article.

Petrosian defeated GM Mikhail Botvinnik in 1963 to become world champion. Tal reached the finals of the 1965 Candidates against GM Boris Spassky. Unfortunately for Tal, Spassky won their match, 7-4, and faced Petrosian in 1966. Petrosian won that match before losing to Spassky in 1969, a match Tal again almost qualified for by reaching the Candidates semifinal where he lost to GM Viktor Korchnoi who lost to Spassky who beat Petrosian who... no wait, that's the end of that process.
The lifetime score between Tal and Petrosian, counting exhibitions/blitz, was 5-5 with 36 draws. It would have been an epic world championship match, no doubt producing multiple brilliancies as the unstoppable force of Tal met the immovable object of Petrosian. And if Tal had become world champion a second time, there's no telling where he'd be ranked among the best chess players in history, which is currently generally somewhere around 10th.
'''
                },
                {
                  'title': '''Karpov vs. Fischer''',
                  'content':
                      '''This is the obvious one everybody talks about. To this day, more than 45 years later, people still debate who would have won. Karpov can't seem to get out of an interview without being asked about it. This is also the only match on the list where the would-be contestants never played each other in any situation, let alone a championship, only adding to the intrigue.
      Technically speaking, this match did happen, and Fischer forfeited. He attempted to take some old-school control over the championship process as the active titleholder. Fischer could not pick his challenger, but he could try to change the match format. FIDE was fine with switching from best-of-24 to first-to-10 wins, but was not in favor of Fischer's demand that he retain the title in a 9-9 tie. And that was that.
      Where Tal-Petrosian would have been a clash of playing styles, and the later Kasparov-Karpov matches were, Fischer-Karpov would have been an interesting study of what happens when world-class players with similar styles meet. 

If Fischer's chess had a defining characteristic, it was the ability to find counterintuitive moves in the right moment. Examples include 18...Nxg2 against GM Robert Byrne in 1963, 13...Kxe7 against GM Milan Matulovic in 1968, and 22.Nxd7+ against Petrosian in 1971. Fischer needed a very keen positional sense to know exactly when to break the general principles of chess, yet perhaps no player is better known for a "keen positional sense" than Karpov.
'''
                },
                {
                  'title': '''Kasparov vs. Carlsen''',
                  'content':
                      '''When Kasparov ended his competitive chess career in March 2005, he was still the top-rated player in the world, as he had been for a whopping 20 years. His retirement was followed by a five-year period of GMs Viswanathan Anand, Vladimir Kramnik, and Veselin Topalov trading the number-one spot. That ended when Carlsen took the lead position in 2010. He has yet to relinquish it.
      This is the only match on this list that could not have logistically happened in the timeline we live in. But suppose Kasparov was born just two years later and Carlsen two years earlier. Now maybe a younger Kasparov does not become world champion until 1987. (Or maybe 1987 is the new 1984, but we didn't change Karpov's age, you know.) Then, perhaps, without the disillusionment of his 1984-86 matches with Karpov, Kasparov never splits from FIDE. That in itself is a major and welcome change in this timeline, but I digress.
      Now, all we would need is for Kasparov to hold the title until Carlsen arrived in 2008, instead of 2010 when Magnus became world number-one. Maybe Kramnik never gets a match with Kasparov in a normal cycle, and that's all this timeline needs for our match to happen. Or perhaps Kramnik takes it in 1999, Anand in 2002, and Kasparov takes it back in 2005. Whatever the situation, we just need Kasparov to win in 2005. He ain't gonna retire in the middle of a championship reign.

While we never got to see Kasparov and Carlsen face off in their primes, we have seen them play on occasion. The year before Kasparov retired, he met Carlsen in a rapid tournament in Reykjavik. Carlsen was only 13 years old and still an IM. He lost a game but also held a draw.
'''
                }
              ]
            }
            */















            

/*
------------------------------------------------------------------------
*/





/*
[
  'Suliman Awad',
'Fadi Futainah',
'Mustafa Kurdi',
'Kamel Habib',
'Ismaiel Alrefaey',
'Mohammad Haj',
'Moayad Mak',
'Osama Abd Rabboh',
'Narotu Shiboden',
'Sasuki Otshiha',
'Goko Siance',
'Vegeta Siance',
'Johan Siance',
'Ghon Ferex',
'Kilua Zoldek'
]
*/









/*
Map user = {
  'name': 'Suliman Awad',
  'rate': 0,
  'avatar': 10,
  'gamePlayed': 398,
  'winRate': 97,
  'loseRate': 1,
  'friends': ['Fadi Futainah', ' Mustafa Kurdi',]
};
*/





/*
Map article = {
  'articles': [
    {'title': '', 'content': ''},
    {'title': '', 'content': ''},
    {'title': '', 'content': ''}
  ]
};
*/





/*
Map leaderBoard = {
  'users': [
    'Suliman Awad',
    'Fadi Futainah',
    'Mustafa Kurdi',
    'Ismaeil Alrefaey',
    'Kamel Habib'
  ]
};
*/






/*
Map lobby = {
  'usersNum': 3,
  'id': 1,
  'type': 'Blitz',
  'users': ['Suliman Awad', 'FadiFutainah', 'Mustafa Kurdi']
};
*/







/*
Map game = {
  'user1': 'Suliman Awad',
  'user2': 'Fadi Futainah',
  'user1GoodMoves': 53,
  'isTopGame': true,
  'user2RateChange': -43,
  'user2GoodMoves': 46,
  'id': 1,
  'user1RateChange': 50,
  'user1Result': 'Win'
};
*/







/*
Map chat = {
  'user1': 'Suliman Awad',
  'user2': 'Fadi Futainah',
  'messages': [
    {'sender': 1, 'message': 'Hello'},
    {'sender': 2, 'message': 'Welcome'}
  ],
  'id': 1
};
*/


