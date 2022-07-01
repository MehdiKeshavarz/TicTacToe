import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  bool isTurnO = true;

  List<String> XOrOList = ['', '', '', '', '', '', '', '', ''];

  int filledBoxes = 0;

  bool gameHasResult = false;

  int scoreX = 0;
  int scoreO = 0;

  String winnerTitle = '';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5.0),
            child: IconButton(
              iconSize: 35,
              onPressed: () {
                ClearGame();
              },
              icon: Icon(Icons.refresh),
            ),
          ),
        ],
        centerTitle: true,
        title: Text('TicTacToe',
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
        elevation: 0,
        backgroundColor: Colors.grey[900],
      ),
      body: SafeArea(
        child: Column(
          children: [
            ScoreBorad(),
            SizedBox(height: 15),
            getResultButton(),
            SizedBox(height: 15),
            getGridView(),
            getTrun(),
          ],
        ),
      ),
    );
  }

  Widget getResultButton() {
    return Visibility(
      visible: gameHasResult,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          primary: Colors.white,
          side: BorderSide(color: Colors.white, width: 2),
        ),
        onPressed: () {
          gameHasResult = false;
          ClearGame();
        },
        child: Text(
          '$winnerTitle, play again',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget getTrun() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Text(
        isTurnO ? 'trunO' : 'trunX',
        style: TextStyle(
          fontSize: 25,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget getGridView() {
    return Expanded(
      child: GridView.builder(
        itemCount: 9,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              tapped(index);
            },
            child: Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Text(
                  XOrOList[index],
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    color: XOrOList[index] == 'X' ? Colors.white : Colors.red,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void tapped(int index) {
    if (gameHasResult) {
      return;
    }
    setState(() {
      if (XOrOList[index] != '') {
        return;
      }

      if (isTurnO) {
        XOrOList[index] = 'O';
        filledBoxes = filledBoxes + 1;
      } else {
        XOrOList[index] = 'X';
        filledBoxes = filledBoxes + 1;
      }
      isTurnO = !isTurnO;
      checkWineer();
    });
  }

  void checkWineer() {
    if (XOrOList[0] == XOrOList[1] &&
        XOrOList[0] == XOrOList[2] &&
        XOrOList[0] != '') {
      setResult(XOrOList[0], 'winner is' + XOrOList[0]);
      return;
    }

    if (XOrOList[3] == XOrOList[4] &&
        XOrOList[3] == XOrOList[5] &&
        XOrOList[3] != '') {
      setResult(XOrOList[3], 'winner is' + XOrOList[3]);
      return;
    }

    if (XOrOList[6] == XOrOList[7] &&
        XOrOList[6] == XOrOList[8] &&
        XOrOList[6] != '') {
      setResult(XOrOList[6], 'winner is' + XOrOList[6]);
      return;
    }

    if (XOrOList[0] == XOrOList[3] &&
        XOrOList[0] == XOrOList[6] &&
        XOrOList[0] != '') {
      setResult(XOrOList[0], 'winner is' + XOrOList[0]);
      return;
    }

    if (XOrOList[1] == XOrOList[4] &&
        XOrOList[1] == XOrOList[7] &&
        XOrOList[1] != '') {
      setResult(XOrOList[1], 'winner is' + XOrOList[1]);
      return;
    }

    if (XOrOList[2] == XOrOList[5] &&
        XOrOList[2] == XOrOList[8] &&
        XOrOList[2] != '') {
      setResult(XOrOList[2], 'winner is' + XOrOList[2]);
      return;
    }

    if (XOrOList[0] == XOrOList[4] &&
        XOrOList[0] == XOrOList[8] &&
        XOrOList[0] != '') {
      setResult(XOrOList[0], 'winner is' + XOrOList[0]);
      return;
    }

    if (XOrOList[2] == XOrOList[4] &&
        XOrOList[2] == XOrOList[6] &&
        XOrOList[2] != '') {
      setResult(XOrOList[2], 'winner is' + XOrOList[2]);
      return;
    }

    if (filledBoxes == 9) {
      setResult('', 'Drow');
      return;
    }
  }

  Widget ScoreBorad() {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Player O',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$scoreO',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Player X',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  '$scoreX',
                  style: TextStyle(color: Colors.white, fontSize: 26),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  void ClearGame() {
    setState(() {
      for (var i = 0; i < XOrOList.length; i++) {
        XOrOList[i] = '';
      }
    });

    filledBoxes = 0;
  }

  void setResult(String winner, String title) {
    setState(() {
      gameHasResult = true;
      winnerTitle = title;
      if (winner == 'X') {
        scoreX = scoreX + 1;
      } else if (winner == 'O') {
        scoreO = scoreO + 1;
      } else {
        scoreO = scoreO + 1;
        scoreX = scoreX + 1;
      }
    });
  }
}
