/**
 * Created by 1 on 12.05.2021.
 */

import { LightningElement,track } from 'lwc';

export default class HelloIteration extends LightningElement {
    @track
    contacts = [
        {
            Id: 1,
            Name: 'Amy Taylor',
            Title: 'VP of Engineering',
        },
        {
            Id: 2,
            Name: 'Michael Jones',
            Title: 'VP of Sales',
        },
        {
            Id: 3,
            Name: 'Jennifer Wu',
            Title: 'CEO',
        },
    ];
}