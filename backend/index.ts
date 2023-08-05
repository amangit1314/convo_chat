/* eslint-disable @typescript-eslint/indent */
/* eslint-disable @typescript-eslint/no-unused-vars */
import app from './app';

const port = process.env.PORT || 5000;
app.listen(port, () => {
    console.log(`🎶🎼  Listening: http://localhost:${port}`);
});
