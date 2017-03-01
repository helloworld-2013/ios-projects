import React from 'react';
import { Text, TouchableOpacity } from 'react-native';

const Button = ({ onPress, children }) => {
  return (
    <TouchableOpacity style={buttonStyle.defaultButtonStyle} onPress={onPress}>
      <Text style={buttonStyle.defaultTextStyle}>
        {children}
      </Text>
    </TouchableOpacity>
  );
};

const buttonStyle = {
  defaultTextStyle: {
    alignSelf: 'center',
    color: '#007AFF',
    fontSize: 16,
    fontWeight: '600',
    paddingTop: 10,
    paddingBottom: 10
  },
  defaultButtonStyle: {
    flex: 1,
    alignSelf: 'stretch',
    backgroundColor: '#FFF',
    borderRadius: 5,
    borderWidth: 1,
    borderColor: '#007AFF',
    marginLeft: 5,
    marginRight: 5
  }
};

export default Button;
