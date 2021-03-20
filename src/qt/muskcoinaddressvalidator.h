// Copyright (c) 2011-2014 The Muskcoin Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef MUSKCOIN_QT_MUSKCOINADDRESSVALIDATOR_H
#define MUSKCOIN_QT_MUSKCOINADDRESSVALIDATOR_H

#include <QValidator>

/** Base58 entry widget validator, checks for valid characters and
 * removes some whitespace.
 */
class MuskcoinAddressEntryValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MuskcoinAddressEntryValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

/** Muskcoin address widget validator, checks for a valid muskcoin address.
 */
class MuskcoinAddressCheckValidator : public QValidator
{
    Q_OBJECT

public:
    explicit MuskcoinAddressCheckValidator(QObject *parent);

    State validate(QString &input, int &pos) const;
};

#endif // MUSKCOIN_QT_MUSKCOINADDRESSVALIDATOR_H
