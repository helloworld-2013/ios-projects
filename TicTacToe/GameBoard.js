import React, { Component } from 'react';
import { TouchableWithoutFeedback, View } from 'react-native';

import styles from './GameBoardStyles'
import Circle from './Circle'
import Cross from './Cross'
import {
  CENTER_POINTS,
  AREAS,
  CONDITIONS,
  GAME_RESULT_NO,
  GAME_RESULT_USER,
  GAME_RESULT_AI,
  GAME_RESULT_TIE
} from './GameBoardConst'

import PromptArea from './PromptArea'

export default class GameBoard extends Component {
  state: {
  	player1: number[],
  	player2: number[],
  	turn: number,
  	result: number
  };

  constructor() {
  	super()
  	this.state = {
  	  player1: [],
  	  player2: [],
  	  turn: 1,
  	  result: -1
  	}
  }

  restart() {
    this.setState({
  	  player1: [],
  	  player2: [],
  	  turn: 1,
  	  result: -1
    })
  }

  isWinner(inputs: number[]) {
    return CONDITIONS.some(d => d.every(item => inputs.indexOf(item) !== -1))
  }

  judgeWinner() {
  	const { player1, player2, result } = this.state

  	const inputs = player1.concat(player2)

  	if (inputs.length >= 5 ) {
  	  let res = this.isWinner(player1)
  	  if (res && result !== GAME_RESULT_USER) {
		return this.setState({ result: GAME_RESULT_USER })
  	  }

  	  res = this.isWinner(player2)
  	  if (res && result !== GAME_RESULT_AI) {
		return this.setState({ result: GAME_RESULT_AI })
  	  }

      if (inputs.length === 9 &&
          result === GAME_RESULT_NO && result !== GAME_RESULT_TIE) {
        this.setState({ result: GAME_RESULT_TIE })
      }
  	}
  }

  boardClickHandler(e: Object) {
  	const { locationX, locationY } = e.nativeEvent

    const area = AREAS.find(d =>
      (locationX >= d.startX && locationX <= d.endX) &&
      (locationY >= d.startY && locationY <= d.endY))

    const { player1, player2 } = this.state

    const inputs = player1.concat(player2)

    const nextTurn = this.state.turn === 1 ? 2 : 1

    if (area && inputs.every(d => d !== area.id)) {
      this.setState({ turn: nextTurn })
      if (nextTurn === 1) {
      	this.setState({ player1: player1.concat(area.id) })
      } else {
      	this.setState({ player2: player2.concat(area.id) })
      }
      setTimeout(() => {
        this.judgeWinner()
      }, 5)
    }
  }

  render() {
  	const { player1, player2, result } = this.state
  	return (
  	  <View style={styles.container}>
  	    <TouchableWithoutFeedback onPress={e => this.boardClickHandler(e)}>
  	      <View style={styles.board}>
            <View
              style={styles.line}
            />
            <View
              style={[styles.line, {
                width: 3,
                height: 306,
                transform: [
                  {translateX: 200}
                ]
              }]}
            />
            <View
              style={[styles.line, {
                width: 306,
                height: 3,
                transform: [
                  {translateY: 100}
                ]
              }]}
            />
            <View
              style={[styles.line, {
                width: 306,
                height: 3,
                transform: [
                  {translateY: 200}
                ]
              }]}
            />
            {
              player1.map((d, i) => (
                <Circle
                  key={i}
                  xTranslate={CENTER_POINTS[d].x}
                  yTranslate={CENTER_POINTS[d].y}
                  color='deepskyblue'
                />
              ))
            }
            {
              player2.map((d, i) => (
                <Cross
                  key={i}
                  xTranslate={CENTER_POINTS[d].x}
                  yTranslate={CENTER_POINTS[d].y}
                />
              ))
            }
	      </View>
  	    </TouchableWithoutFeedback>
  	    <PromptArea result={result} onRestart={() => this.restart()} />
  	  </View>
  	)
  }
}
