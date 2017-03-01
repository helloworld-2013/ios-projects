import React from 'react';
import { AppRegistry, View } from 'react-native';
import Header from './src/components/header';
import AlbumList from './src/components/album-list';

const App = () => (
  <View style={{ flex: 1 }}>
    <Header headerText={'The Albums'} />
    <AlbumList />
  </View>
);

AppRegistry.registerComponent('TheAlbums', () => App);
